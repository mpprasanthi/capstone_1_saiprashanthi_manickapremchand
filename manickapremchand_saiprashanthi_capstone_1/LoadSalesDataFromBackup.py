import pandas as pd
import sqlalchemy as sqlalchemy

con = sqlalchemy.create_engine("mysql+pymysql://root:Manicka1983@localhost/capstone_1")

sales_backup_df = pd.read_csv('C:\\Users\\mppra\\PycharmProjects\\capstone_1_saiprashanthi_manickapremchand\\manickapremchand_saiprashanthi_capstone_1\\sales_backup.csv')

#Load sales_team data
salesTeamSql = f"select id, emp_id from sales_team"
result = con.execute(salesTeamSql)
empIdDict = {}
for row in result:
    empIdDict[row['emp_id']] = row['id']

#Load year#week:ID value data
calendarSql = f"select id, sales_year,week0 from sales_week_calendar"
result = con.execute(calendarSql)
yearWeekCalendar = {}
for row in result:
    key = f"{row['sales_year']}#W{row['week0']}"
    yearWeekCalendar[key] = row['id']

#Looping the DataFrame from csv file
for row in sales_backup_df.iterrows():
    item_code = row[1]['ITEM_CODE']
    emp_id = row[1]['EMP_ID']
    emp_id_fk = empIdDict.get(emp_id)
    year = row[1]['Year']
    #weeks_sales_count = [row[1]['W0'],row[1]['W1'],row[1]['W2'],row[1]['W3'],row[1]['W4'],row[1]['W5'],row[1]['W6'],row[1]['W7'],row[1]['W8'],row[1]['W9'],row[1]['W10'],row[1]['W11'],row[1]['W12'],row[1]['W13'],row[1]['W14'],row[1]['W15'],row[1]['W16'],row[1]['W17'],row[1]['W18'],row[1]['W19'],row[1]['W20'],row[1]['W21'],row[1]['W22'],row[1]['W23'],row[1]['W24'],row[1]['W25'],row[1]['W26'],row[1]['W27'],row[1]['W28'],row[1]['W29'],row[1]['W30'],row[1]['W31'],row[1]['W32'],row[1]['W33'],row[1]['W34'],row[1]['W35'],row[1]['W36'],row[1]['W37'],row[1]['W38'],row[1]['W39'],row[1]['W40'],row[1]['W41'],row[1]['W42'],row[1]['W43'],row[1]['W44'],row[1]['W45'],row[1]['W46'],row[1]['W47'],row[1]['W48'],row[1]['W49'],row[1]['W50'],row[1]['W51']]
    weeks = ['W0','W1','W2','W3','W4','W5','W6','W7','W8','W9','W10','W11','W12','W13','W14','W15','W16','W17','W18','W19','W20','W21','W22','W23','W24','W25','W26','W27','W28','W29','W30','W31','W32','W33','W34','W35','W36','W37','W38','W39','W40','W41','W42','W43','W44','W45','W46','W47','W48','W49','W50','W51']
    for weekly in weeks:
        sales_count = row[1][weekly]
        year_week_key = f"{year}#{weekly}"
        sales_week_calendar_id = yearWeekCalendar.get(year_week_key)
        if sales_count>0 :
            sqlSalesInsert = f"INSERT INTO SALES(item_code, emp_id, year_week, sold_count, sale_date) VALUES('{item_code}', {emp_id_fk},{sales_week_calendar_id} ,{sales_count}, SYSDATE())";
            con.execute(sqlSalesInsert)



