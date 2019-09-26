#!/usr/bin/env python
# coding: utf-8

# ## Recommender System For Who to Follow on Lucid Blog

# ## Word2Vec Model
# 
# The use of word2vec model which takes into account follower's history to be able to predict the next 6 people to follow by basis of how similar the users are.

# In[1]:


# Import the libraries needed 
import pandas as pd
import mysql.connector
from sqlalchemy import create_engine
import numpy as np
import random
from gensim.models import Word2Vec
from tqdm import tqdm


# In[2]:


# The details for connecting to the sql database of lucid blog which was hosted remotely
mydb = mysql.connector.connect(host="remotemysql.com",user="8SawWhnha4", passwd="zFvOBIqbIz",database="8SawWhnha4")

# The mysql engine to be queried and read 
engine = create_engine('mysql+mysqlconnector://8SawWhnha4:zFvOBIqbIz@remotemysql.com/8SawWhnha4')

# Creating the dataframes from the user and following tables in the lucid blog database
users = pd.read_sql_query("select * from users", engine)
following = pd.read_sql_query("select * from following", engine)


# ### Exploring and Manipulating the data

# In[3]:


# Look  at the shape of the following data which will be used in predicting who to follow
print("The shape of the data, following is ",following.shape)

# See the first five rows
following.head()

# change the column names
print("The column names are ",following.columns)

# Rename the columns
following.columns = ['user_id', 'follower_id', 'status']

# Check a subset of the dataset to confirm if the columns have been renamed
print("The new dataframe head is ",following.head())

# Drop the status column
following = following[['user_id', 'follower_id']]


# #### More manipulation of the dataset to prepare it for model training and evaluation

# In[4]:


# Since we will be using Word2Vec, we need our follower id to be in string
following['follower_id']= following['follower_id'].astype(str)

# Create number of unique users
unique_users = following['user_id'].unique().tolist()

# check the length of uniques users
print("The number of unique users is ",len(unique_users), " users")


# In[5]:


# Shuffle the users and split into training and testing

random.shuffle(unique_users)

# Extract 95% of users
unique_users_train = [unique_users[i] for i in range(round(0.95 * len(unique_users)))]

# split into train and test data
train_df = following[following['user_id'].isin(unique_users_train)]
test_df = following[~following['user_id'].isin(unique_users_train)]
print(train_df.shape)
print(test_df.shape)


# In[6]:


# Create a follower history for each user  for both training and testing data

# Training data History
follower_history_train = []

# Fill the list with follower id, this indicates the history of people following a user
for i in tqdm(unique_users_train):
    temp = train_df[train_df['user_id'] == i]['follower_id'].tolist()
    follower_history_train.append(temp)
    

# Testing data
follower_history_test = []
for i in tqdm(test_df['user_id'].unique()):
    temp = test_df[test_df['user_id'] == i]['follower_id'].tolist()
    follower_history_test.append(temp)


# In[7]:


# View the lengths of the 2 histories
print("The length of follower history for training data is ",len(follower_history_train))
print("The length of follower history for training data is ",len(follower_history_test))


# In[8]:


# Using the word2vec model to check the similar users
# train word2vec model
model = Word2Vec(window = 10, sg = 1, hs = 0,
                 negative = 10, # for negative sampling
                 alpha=0.03, min_alpha=0.0007,
                 seed = 14)

model.build_vocab(follower_history_train, progress_per=200)

model.train(follower_history_train, total_examples = model.corpus_count, 
            epochs=10, report_delay=1)


# In[9]:


# Edit the users table for easy recommendation
users = users[["id", "name", "short_bio"]]

# remove duplicates
users.drop_duplicates(inplace=True, subset='id', keep="last")


# In[10]:


# Function to predict who to follow
def similar_users(vector, n = 6):
    
    # extract most similar users for the input vector
    msu = model.wv.similar_by_vector(vector, topn= n+1)[1:]

    # extract name of the similar users
    similar_us = []
    for i in msu:
        similar_us.append(i[0])
        people_to_follow = users[users['id'].isin(similar_us)]
    return people_to_follow


# ## Test the Word2Vec Recommender Model

# In[11]:


# Test the recommender system with the test data
test_df = test_df.reset_index().drop('index',1)


# In[40]:


# using a user from the test data, recommend who to fllow
test_user = users['id'].astype(str)[3]
print(test_user)
# print the name of the user


print("The name of the test_user is ",users.name[int(test_user)])

# People to follow for the user
similar_users(model[test_user])


# ## TFIDF Model
# 
# The use of Tfidf model which takes into account the importance of each word in the bio description of each user and find the similarities using cosine similarities among different users

# In[41]:


from sklearn.metrics.pairwise import linear_kernel
from sklearn.feature_extraction.text import TfidfVectorizer


# In[42]:


lucid_tfidf = TfidfVectorizer(stop_words='english')
# filling the missing values with empty string
users['short_bio'] = users['short_bio'].fillna('')
# computing TF-IDF matrix required for calculating cosine similarity
users_short_bio_matrix = lucid_tfidf.fit_transform(users['short_bio'])
print("The users matrix shape is ", users_short_bio_matrix.shape)


# In[43]:


users


# In[44]:


#calculating the cosine similarity for our users_short_bio_matrix 
cosine_similarity = linear_kernel(users_short_bio_matrix, users_short_bio_matrix)
#getting our user indices
user_indices = pd.Series(users['name'].index)

#function to recommend user to follow based on similarities in their short_bio
def recommend_to_follow(index, cosine_sim=cosine_similarity):
    if index<users_short_bio_matrix.shape[0]:
        id = user_indices[index]
        # Get the pairwsie similarity scores of all names
        # sorting them and getting top 5
        similarity_scores = list(enumerate(cosine_sim[id]))
        similarity_scores = sorted(similarity_scores, key=lambda x: x[1], reverse=True)
        similarity_scores = similarity_scores[1:6]
        
        # Get the names index
        lucid_index = [i[0] for i in similarity_scores]
        # Return the top 5 most similar names
        return users['name'].iloc[lucid_index]
    else: return "No recommedations for this user"


# ### Testing the TFIDF Recommender Model

# In[45]:


print("People to follow ",recommend_to_follow(50))
print("People to follow ",recommend_to_follow(245))
print("People to follow ", recommend_to_follow(2456))
print("People to follow ", recommend_to_follow(750))


# ## Who To Follow Recommendation on New Users Based on Popularity

# In[46]:


notifications = pd.read_sql_query("select * from notifications", engine)

event_type_strength = {
    'Like': 1.0,
    'Replied':2.0,
    'Commented': 3.0,
    'Love': 4.0,
    'Followed': 5.0
}

notifications['eventStrength'] = notifications['action'].apply(lambda x: event_type_strength[x])

item_popularity_df = notifications.groupby('sender_id')['eventStrength'].sum().sort_values(ascending=False).reset_index()


def who_to_follow():
    return item_popularity_df.head(6)


# ### Testing the recommendation system for new users based on popularity

# In[47]:


who_to_follow()

