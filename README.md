
<div align="center">

![hng](https://res.cloudinary.com/iambeejayayo/image/upload/v1554240066/brand-logo.png)

<br>

</div>

# RECOMMENDER SYSTEM FOR LUCID.BLOG

This is the Task submission by Team C++ of the HNG Internship 6.0. We were assigned to build a Recommender System for lucid.blog. The recommender suggests who to follow and what articles to read for users based on data gathered from lucid database.


The following steps were taken to achieve the objectives:

We imported the necessary libraries:
```bash
import pandas as pd
import mysql.connector
from sqlalchemy import create_engine
```


Loaded the dataset
```bash
mydb = mysql.connector.connect(host="remotemysql.com",
                              user="8SawWhnha4",
                              passwd="zFvOBIqbIz",
                              database="8SawWhnha4")

engine = create_engine('mysql+mysqlconnector://8SawWhnha4:zFvOBIqbIz@remotemysql.com/8SawWhnha4')
```

Fetched  the tables in the dataset

```bash
dbcursor = mydb.cursor()
dbcursor.execute('show tables')
for table in dbcursor:
    print(table)
```
Next we did some Exploratory Data Analysis
## EXPLORATORY DATA ANALYSIS

checked the comments table

checking out the contact_settings table









