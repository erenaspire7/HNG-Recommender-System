
<div align="center">

![hng](https://res.cloudinary.com/iambeejayayo/image/upload/v1554240066/brand-logo.png)

<br>

</div>

# RECOMMENDER SYSTEM FOR LUCID.BLOG

## INTRODUCTION
This is the Task submission by Team C++ of the HNG Internship 6.0. We were assigned to build a Recommender System for lucid.blog. The recommender suggests who to follow and what articles to read for users based on data gathered from lucid database.

 ## Getting Started
The following steps were taken to achieve the objectives:

## Prerequisites
We imported the necessary libraries:
```bash
import pandas as pd
import mysql.connector
from sqlalchemy import create_engine
```


- Loaded the dataset
```bash
mydb = mysql.connector.connect(host="remotemysql.com",
                              user="8SawWhnha4",
                              passwd="zFvOBIqbIz",
                              database="8SawWhnha4")

engine = create_engine('mysql+mysqlconnector://8SawWhnha4:zFvOBIqbIz@remotemysql.com/8SawWhnha4')
```

- Fetched  the tables in the dataset

```bash
dbcursor = mydb.cursor()
dbcursor.execute('show tables')
for table in dbcursor:
    print(table)
```
- Next we did some Exploratory Data Analysis
## EXPLORATORY DATA ANALYSIS
- We checked out the comments table,contact_settings table,ext_feed_banks table,ext_rsses table,following table, etc.
for relevant keys in user and post data frame and procceded to check their shapes.

```bash
users.keys()
posts.keys()
users.shape,posts.shape
```
- Checked users with similar short_bio and those who posted similar title we  applied this syntax

```bash
users['short_bio'].value_counts()
posts['title'].value_counts()
```

## DATA WRANGLING
We proceeded with Data Wrangling by applying the below syntax to get rid of html tags,white lines,square brackets and image files so we can have clean data for our Model

```bash
posts['content'] = posts['content'].str.replace(r'<[^>]*>', '')
posts['content'] = posts['content'].str.replace(r'\s', ' ')
posts['content'] = posts['content'].str.replace(r'\[.*?\]', '')
posts['content'] = posts['content'].str.replace(r'\(.*?\)', '')
```

## MODEL FOR WHO TO FOLLOW ON LUCID.BLOG
We required a few steps to make our model perfect:-
- Imported relevant modules

```bash
import pandas as pd
from sklearn.metrics.pairwise import linear_kernel
from sklearn.feature_extraction.text import TfidfVectorizer
```

- Filled missing values with empty string and computing TF-IDF matrix required for calculating cosine similarity
```bash
users['short_bio'] = users['short_bio'].fillna('')
users_short_bio_matrix = lucid_tfidf.fit_transform(users['short_bio'])
```
- Got the shape of the Dataframe
```bash
users_short_bio_matrix.shape
```
- Calculated the cosine similarity for our users_short_bio_matrix and got our user indices

- Created a function to recommend user to follow based on similarities in their short_bio
```bash
def recommend_to_follow(index, cosine_sim=cosine_similarity):
    if index<users_short_bio_matrix.shape[0]:
        id = user_indices[index]
         similarity_scores = list(enumerate(cosine_sim[id]))
        similarity_scores = sorted(similarity_scores, key=lambda x: x[1], reverse=True)
        similarity_scores = similarity_scores[1:6]
         lucid_index = [i[0] for i in similarity_scores]
     Return the top 5 most similar names
        return users['name'].iloc[lucid_index]
    else: return "No recommedations for this user"
   ```
 
## MODEL FOR WHAT ARTICLE TO READ ON LUCID.BLOG

The following steps were repeated:-
- Filled missing values with empty string
- Computed TF-IDF matrix required for calculating cosine similarity
- Checked shape of our posts matrix
- Calculated cosine similarity for our post_matrix
- Got our post indices

- Created a function to recommend articles to read,getting pairwise similarity score sorting them and getting top 5
```bash
def recommend_article_to_read(index, cosine_sim=cosines_similarity):
    if index<posts_matrix.shape[0]:
        id = posts_indices[index]
        # Get the pairwsie similarity scores of all names
        # sorting them and getting top 5
        similarity_scores = list(enumerate(cosine_sim[id]))
        similarity_scores = sorted(similarity_scores, key=lambda x: x[1], reverse=True)
        similarity_scores = similarity_scores[1:6]
        # Get the names index
        lucid_index = [i[0] for i in similarity_scores]
        # Return the top 5 most similar names
        return posts['title'].iloc[lucid_index]
    else: return "No recommedations for this user"   
```

## HOW THE RECOMMENDER SYSTEM WORKS 
  
### TEST FOR WHO TO FOLLOW RECOMMENDER SYSTEM FOR LUCID.BLOG
  ```bash
  recommend_to_follow(50)
  #This displays something like:
  105     Damilare Olabimtan
  279        UDENKWOR NKECHI
  438         Angela Egerega
  604    chukwuemeka anyanwu
  641          Deborah Ajayi
```
### TEST FOR WHAT ARTICLE TO READ RECOMMENDER SYSTEM FOR LUCID.BLOG
```bash
recommend_article_to_read(24)
#This displays something like:
0    I learnt how to use the table tag as i have us...
1     I am on this journey with start.ng, and here ...
2    I have not been attending classes on the HNG c...
3    My journey on **StartNG** pre-internship progr...
4     A Summary on The “idongesit.html” CV, Its Str...
```
## Built with Anaconda's Jupyter notebook by TEAM C++





