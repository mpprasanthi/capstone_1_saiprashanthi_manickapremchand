from flask_wtf import FlaskForm
from wtforms import StringField, IntegerField, SubmitField

class AddSalesEntry(FlaskForm):
    employee_id = StringField('Salesperson Employee ID:')
    product_id = StringField('Product ID:')
    sold_count = IntegerField('Sold Count:')
    year_sold = IntegerField('Year Sold')
    week_sold = IntegerField('Week Sold')
    submit = SubmitField('Add Sales')
