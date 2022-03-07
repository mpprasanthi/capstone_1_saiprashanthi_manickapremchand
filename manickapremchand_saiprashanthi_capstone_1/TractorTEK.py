#import os
from SalesEntryForm import AddSalesEntry
from flask import Flask, render_template, url_for, redirect
from flask_sqlalchemy import SQLAlchemy
import sqlalchemy as sqlalchemy
#from flask_migrate import Migrate

app = Flask(__name__)
# Key for Forms
app.config['SECRET_KEY'] = 'mysecretkey'

############################################
        # SQL DATABASE AND MODELS
##########################################
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:Manicka1983@localhost/capstone_1'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)
con = sqlalchemy.create_engine("mysql+pymysql://root:Manicka1983@localhost/capstone_1")

@app.route('/')
def index():
    return render_template('home.html')

@app.route('/salesAdded')
def sales_added():
    return render_template('sales_added.html')

@app.route('/salesDisplay')
def sales_display():
    salesData = []
    sqlSalesDisplay = f"select * from sales";
    sales_result = con.execute(sqlSalesDisplay)
    counter = 0
    for row_sales_result in sales_result:
        item_code = row_sales_result['item_code'] # use as it is
        sold_count = row_sales_result['sold_count']# use as it is
        emp_id = row_sales_result['emp_id'] #Get the actual fields from sales_team table
        year_week = row_sales_result['year_week'] #Get the actual fields from sales_week_calendar table

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

        salesData.insert(counter, [emp_id,sales_team_lead, pay_grade,region, item_code,sold_count,sales_year,sales_week,sales_quarter])
        counter = counter+1
    return render_template('sales_display.html', sales = salesData)

@app.route('/addsales', methods=['GET', 'POST'])
def sales_entry():
    sales_form = AddSalesEntry()
    if sales_form.validate_on_submit():
        employee_id = sales_form.employee_id.data
        product_id = sales_form.product_id.data
        sold_count = sales_form.sold_count.data
        year_sold = sales_form.year_sold.data
        week_sold = sales_form.week_sold.data

        isValid = True
        emp_id = 0
        sales_week_calendar_id = 0;
        item_code = ''

        emp_id, isValid = emp_id_validation(emp_id, employee_id, sales_form, isValid)

        isValid, item_code = prod_id_validation(sales_form, isValid, item_code, product_id)

        isValid, sales_week_calendar_id = calendar_validation(sales_form, isValid, sales_week_calendar_id,
                                                              week_sold, year_sold)
        if isValid == False:
            return render_template('sales_entry.html', form=sales_form)

        # INSERT INTO SALES TABLES
        sqlSalesInsert = f"INSERT INTO SALES(item_code, emp_id, year_week, sold_count, sale_date) VALUES('{item_code}', {emp_id},{sales_week_calendar_id} ,{sold_count}, SYSDATE())";
        con.execute(sqlSalesInsert)

        return redirect(url_for('sales_added'))
    return render_template('sales_entry.html', form=sales_form)


def calendar_validation(sales_form, isValid, sales_week_calendar_id, week_sold, year_sold):
    # Calender Validation
    sqlWeekCalendarCheck = f"SELECT ID FROM sales_week_calendar WHERE sales_year='{year_sold}' AND week0 = '{week_sold}'";
    result = con.execute(sqlWeekCalendarCheck)
    result_count = 0
    for row in result:
        result_count = result_count + 1
        sales_week_calendar_id = row['ID']
    if result_count == 0:
        isValid = False
        sales_form.year_sold.errors = " : Invalid Year Or Week  "
    return isValid, sales_week_calendar_id


def prod_id_validation(sales_form, isValid, item_code, product_id):
    # Product / ESP validation
    sqlProductCheck = f"SELECT ID FROM products WHERE prod_code='{product_id}'";
    result = con.execute(sqlProductCheck)
    result_count = 0
    for row in result:
        result_count = result_count + 1
        item_code = product_id
    if result_count == 0:
        sqlESPCheck = f"SELECT ID FROM esp WHERE esp_code='{product_id}'";
        result = con.execute(sqlESPCheck)
        for row in result:
            result_count = result_count + 1
            item_code = product_id
        if result_count == 0:
            isValid = False
            sales_form.product_id.errors = " : Invalid Product or ESP ID"
    return isValid, item_code


def emp_id_validation(emp_id, employee_id, sales_form, isValid):
    # Employee ID Validation
    if(employee_id is None):
        sales_form.employee_id.errors = " : Please enter Employee ID"

    sqlEmpCheck = f"SELECT ID FROM SALES_TEAM WHERE EMP_ID='{employee_id}'";
    result = con.execute(sqlEmpCheck)
    result_count = 0
    for row in result:
        result_count = result_count + 1
        emp_id = row['ID']
    if result_count == 0:
        isValid = False
        sales_form.employee_id.errors = " : Invalid Employee ID"
    return emp_id, isValid


if __name__ == '__main__':
    app.run(debug=True)