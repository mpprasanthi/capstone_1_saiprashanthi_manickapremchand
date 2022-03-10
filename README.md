# capstone_1_saiprashanthi_manickapremchand
Steps to run Capstone 1 Project

cd manickapremchand_saiprashanthi_capstone_1

python -m venv capstone_prashanthi_env

source capstone_prashanthi_env/Scripts/activate

pip install -r requirements.txt
pip install --upgrade pip
pip install pymysql 
pip install cryptography
pip install --upgrade alembic
pip install --upgrade blinker
pip install --upgrade chardet                                     
pip install --upgrade click                                       
pip install --upgrade Flask                                       
pip install --upgrade Flask-Dance                                 
pip install --upgrade Flask-DebugToolbar                          
pip install --upgrade Flask-Login                                 
pip install --upgrade Flask-Migrate                               
pip install --upgrade Flask-OAuth                                 
pip install --upgrade Flask-OAuthlib                              
pip install --upgrade Flask-SQLAlchemy                            
pip install --upgrade Flask-WTF                                   
pip install --upgrade httplib2                                    
pip install --upgrade idna                                        
pip install --upgrade itsdangerous                                
pip install --upgrade Jinja2                                      
pip install --upgrade lazy                                        
pip install --upgrade Mako                                        
pip install --upgrade MarkupSafe                                  
pip install --upgrade oauth2                                      
pip install --upgrade oauthlib                                    
pip install --upgrade python-dateutil                             
pip install --upgrade python-editor                               
pip install --upgrade requests                                    
pip install --upgrade requests-oauthlib                           
pip install --upgrade six                                        
pip install --upgrade SQLAlchemy                                  
pip install --upgrade SQLAlchemy-Utils                            
pip install --upgrade urllib3                                     
pip install --upgrade URLObject                                   
pip install --upgrade Werkzeug                                    
pip install --upgrade wincertstore                                
pip install --upgrade WTForms  
pip install --upgrade sqlalchemy                                   

export FLASK_ENV=development

export flask_app=TractorTEK.py

flask run

#To run CSV file backup data to sales table
python LoadSalesDataFromBackup.py

#To run OLTP to OLAP migration
python OLTPtoOLAP.py