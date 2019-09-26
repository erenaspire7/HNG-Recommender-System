#!/usr/bin/env python
# coding: utf-8

# In[1]:


#importing relevant modules
import pandas as pd
import mysql.connector
from sqlalchemy import create_engine


# In[2]:


#loading the dataset
mydb = mysql.connector.connect(host="remotemysql.com",
                              user="8SawWhnha4",
                              passwd="zFvOBIqbIz",
                              database="8SawWhnha4")

engine = create_engine('mysql+mysqlconnector://8SawWhnha4:zFvOBIqbIz@remotemysql.com/8SawWhnha4')


# In[3]:


#fetching the tables in the dataset
dbcursor = mydb.cursor()
dbcursor.execute('show tables')
for table in dbcursor:
    print(table)


# In[ ]:





# # EXPLOARTOY DATA ANALYSIS

# In[4]:


#checking ou the comments table
comments = pd.read_sql_query('select * from comments', engine)
comments


# In[5]:


#checking out the contact_settings table
contact_settings = pd.read_sql_query('select * from contact_settings', engine)
contact_settings


# In[6]:


#checking out the ext_feed_banks table
ext_feed_banks = pd.read_sql_query('select * from ext_feed_banks', engine)
ext_feed_banks


# In[7]:


#checking out the ext_rsses table
ext_rsses = pd.read_sql_query('select * from ext_rsses', engine)
ext_rsses


# In[8]:


#checking out the following table
following = pd.read_sql_query('select * from following', engine)
following


# In[9]:


#checking out the interests table
interests = pd.read_sql_query('select * from interests', engine)
interests


# In[10]:


#checking out the maillists table
maillists = pd.read_sql_query('select * from maillists', engine)
maillists


# In[11]:


#checking out the migrations table
migrations = pd.read_sql_query('select * from migrations', engine)
migrations


# In[12]:


#checking out the notifications table
notifications = pd.read_sql_query('select * from notifications', engine)
notifications


# In[13]:


#checking out the password_reset table
password_resets = pd.read_sql_query('select * from password_resets', engine)
password_resets


# In[14]:


#checking out the password_reset table
posts = pd.read_sql_query('select * from posts', engine)
posts


# In[15]:


#checking out the thoughts table
thoughts= pd.read_sql_query('select * from thoughts', engine)
thoughts


# In[16]:


#checking out the user_settings table
user_settings= pd.read_sql_query('select * from user_settings', engine)
user_settings


# In[17]:


#checking out the user_settings table
users = pd.read_sql_query('select * from users', engine)
users


# In[18]:


#checking out the users_email_login_tokens table
users_email_login_tokens= pd.read_sql_query('select * from users_email_login_tokens', engine)
users_email_login_tokens


# In[19]:


#checking for relevant keys in the users dataframe
users.keys()


# In[20]:


#checking for relevant keys in the posts dataframe
posts.keys()


# In[21]:


#checking the shape of our users and posts dataframe
users.shape,posts.shape


# In[22]:


users['short_bio'].value_counts()


# In[23]:


posts['title'].value_counts()


# # Data Wrangling

# In[24]:


# Remove html tags
posts['content'] = posts['content'].str.replace(r'<[^>]*>', '')

# Remove white spaces including new lines
posts['content'] = posts['content'].str.replace(r'\s', ' ')

# Remove square brackets
posts['content'] = posts['content'].str.replace(r'\[.*?\]', '')

# Remove image files
posts['content'] = posts['content'].str.replace(r'\(.*?\)', '')


# # BUILDING THE "WHAT ARTICLES TO READ" RECOMMENDER SYSTEM

# In[25]:


from sklearn.metrics.pairwise import linear_kernel
from sklearn.feature_extraction.text import TfidfVectorizer

lucids_tfidf = TfidfVectorizer(stop_words='english')
# filling the missing values with empty string
posts['content'] = posts['content'].fillna('')
# computing TF-IDF matrix required for calculating cosine similarity
posts_matrix = lucids_tfidf.fit_transform(posts['content'])


# In[26]:


#checking the shape of our posts matrix
posts_matrix.shape


# In[27]:


#calculating the cosine similarity for our posts_matrix
cosines_similarity = linear_kernel(posts_matrix, posts_matrix)
#getting our post indices
posts_indices = pd.Series(posts['title'].index)


# In[28]:


#function to recommend user to follow based on similarities in their short_bio
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


# # TESTING THE RECOMMENDER SYSTEM

# In[29]:


recommend_article_to_read(24)


# In[30]:


recommend_article_to_read(34567)


# In[31]:


recommend_article_to_read(345)


# In[32]:


recommend_article_to_read(800)


# In[33]:


recommend_article_to_read(5604)


# In[ ]:




