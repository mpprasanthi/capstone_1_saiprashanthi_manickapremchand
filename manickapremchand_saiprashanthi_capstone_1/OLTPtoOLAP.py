import sqlalchemy as sqlalchemy

con = sqlalchemy.create_engine("mysql+pymysql://root:Manicka1983@localhost/capstone_1")


#sqlSalesDisplay = "select * from sales where sale_date=DATE_FORMAT(sysdate(),'%y-%m-%d')"
sqlSalesDisplay = "select * from sales"
sales_result = con.execute(sqlSalesDisplay)
for row_sales_result in sales_result:
    item_code = row_sales_result['item_code']  # use as it is
    sold_count = row_sales_result['sold_count']  # use as it is
    emp_id = row_sales_result['emp_id']  # Get the actual fields from sales_team table
    year_week = row_sales_result['year_week']  # Get the actual fields from sales_week_calendar table
    sale_date = row_sales_result['sale_date']

    # Get the actual fields from sales_team table -- START
    sqlSalesTeam = f"select * from sales_team where ID = {emp_id}"
    sales_team_result = con.execute(sqlSalesTeam)
    for row_sales_team in sales_team_result:
        sales_team_lead = row_sales_team['sales_team_lead']
        pay_grade = row_sales_team['pay_grade']
        region = row_sales_team['region']
        emp_id = row_sales_team['emp_id']
    # Get the actual fields from sales_team table -- END

    # Get the actual fields from sales_week_calendar table -- START
    sqlCalendar = f"select * from sales_week_calendar where ID = {year_week}"
    sales_calendar = con.execute(sqlCalendar)
    for row_sales_calendar in sales_calendar:
        sales_year = row_sales_calendar['sales_year']
        sales_week = row_sales_calendar['week0']
        sales_quarter = row_sales_calendar['sales_quarter']
    # Get the actual fields from sales_week_calendar table -- END

    # Get more fields from Product / ESP -- START
    sqlIsInProduct = f"select * from products where prod_code='{item_code}'"
    isin_product_result = con.execute(sqlIsInProduct)

    product_id = 0
    item_name = ''
    url = ''
    manufacturer = ''
    warranty_price = 0
    item_price = 0

    for row_isin_product_result in isin_product_result:
        product_id = row_isin_product_result['id']
        item_name = row_isin_product_result['prod_name']
        url = row_isin_product_result['url']
        manufacturer = row_isin_product_result['manufacturer']
        q1_2019_price = row_isin_product_result['q1_2019_price']
        q2_2019_price = row_isin_product_result['q2_2019_price']
        q3_2019_price = row_isin_product_result['q3_2019_price']
        q4_2019_price = row_isin_product_result['q4_2019_price']
        q1_2020_price = row_isin_product_result['q1_2020_price']
        q2_2020_price = row_isin_product_result['q2_2020_price']
        q3_2020_price = row_isin_product_result['q3_2020_price']
        q4_2020_price = row_isin_product_result['q4_2020_price']
        year_week_quarter = f"q{sales_quarter}_{sales_year}_price"

    if product_id > 0:
        print("Item in Product")
        if year_week_quarter=='q1_2019_price':
            item_price = q1_2019_price
        elif year_week_quarter=='q2_2019_price':
            item_price = q2_2019_price
        elif year_week_quarter=='q3_2019_price':
            item_price = q3_2019_price
        elif year_week_quarter=='q4_2019_price':
            item_price = q4_2019_price
        elif year_week_quarter == 'q1_2020_price':
            item_price = q1_2020_price
        elif year_week_quarter == 'q2_2020_price':
            item_price = q2_2020_price
        elif year_week_quarter == 'q3_2020_price':
            item_price = q3_2020_price
        elif year_week_quarter == 'q4_2020_price':
            item_price = q4_2020_price
    else:
        print("Item in ESP")
        sqlIsInEsp = f"select * from esp where esp_code='{item_code}'"
        isin_esp_result = con.execute(sqlIsInEsp)
        for row_isin_esp_result in isin_esp_result:
            warranty_price = row_isin_esp_result['warranty_price']

    # Get the actual fields from Product / ESP-- END

    sqlInsert = f"INSERT INTO SALES_HISTORY(sales_team_lead,pay_grade,region,emp_id,item_code,item_name,item_price,url,manufacturer,warranty_price,sale_year,sale_week,sale_date,sale_count) values ('{sales_team_lead}','{pay_grade}','{region}','{emp_id}','{item_code}','{item_name}',{item_price},'{url}','{manufacturer}',{warranty_price},{sales_year},'{sales_week}','{sale_date}',{sold_count})"
    con.execute(sqlInsert)
