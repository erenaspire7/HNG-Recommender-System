<div align="center">

![hng](https://res.cloudinary.com/iambeejayayo/image/upload/v1554240066/brand-logo.png)

<br>

</div>

# RECOMMENDER SYSTEM FOR LUCID.BLOG

This is the Task submission by Team C++ of the HNG Internship 6.0. We were assigned to build a Recommender System for lucid.blog The recommender suggests who to follow and what articles to read for users based on data gathered from lucid database.
The steps taken were perform Exploratory Data Analysis and built  a model for our recommendation

To achieve the above listed objectives, the following steps were carried out:

1. The relevant libraries were imported in the jupyter notebook such as 

import pandas as pd
import mysql.connector
from sqlalchemy import create_engine

2. Loaded the dataset

mydb = mysql.connector.connect(host="remotemysql.com",
                              user="8SawWhnha4",
                              passwd="zFvOBIqbIz",
                              database="8SawWhnha4")

engine = create_engine('mysql+mysqlconnector://8SawWhnha4:zFvOBIqbIz@remotemysql.com/8SawWhnha4')


3. fetched  the tables in the dataset

dbcursor = mydb.cursor()
dbcursor.execute('show tables')
for table in dbcursor:
    print(table)

The above steps were carried out to set the data ready for extensive data exploratory analysis.








