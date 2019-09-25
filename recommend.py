import pandas as pd
from sklearn.metrics.pairwise import linear_kernel
from sklearn.feature_extraction.text import TfidfVectorizer

users = pd.read_csv('lucid.csv/lucid_table_users.csv', encoding='latin-1')
#users.head()

lucid_tfidf = TfidfVectorizer(stop_words='english')
# filling the missing values with empty string
users['short_bio'] = users['short_bio'].fillna('')
# computing TF-IDF matrix required for calculating cosine similarity
users_matrix = lucid_tfidf.fit_transform(users['short_bio'])

#users_matrix.shape
cosine_similarity = linear_kernel(users_matrix, users_matrix)
indices = pd.Series(users['name'].index)

def recommend(index, cosine_sim=cosine_similarity):
    id = indices[index]
    # Get the pairwsie similarity scores of all names
    # sorting them and getting top 5
    similarity_scores = list(enumerate(cosine_sim[id]))
    similarity_scores = sorted(similarity_scores, key=lambda x: x[1], reverse=True)
    similarity_scores = similarity_scores[1:6]

    # Get the names index
    lucid_index = [i[0] for i in similarity_scores]

    # Return the top 5 most similar names
    return users['name'].iloc[lucid_index]

print(recommend(2))

posts = pd.read_csv('lucid.csv/lucid_table_posts.csv', encoding='latin-1')
#posts.head()

lucids_tfidf = TfidfVectorizer(stop_words='english')
# filling the missing values with empty string
posts['content'] = posts['content'].fillna('')
# computing TF-IDF matrix required for calculating cosine similarity
posts_matrix = lucids_tfidf.fit_transform(posts['content'])

#posts_matrix.shape

cosines_similarity = linear_kernel(posts_matrix, posts_matrix)
indicess = pd.Series(posts['title'].index)

def recommend(index, cosine_sim=cosines_similarity):
    id = indicess[index]
    # Get the pairwsie similarity scores of all names
    # sorting them and getting top 5
    similarity_scores = list(enumerate(cosine_sim[id]))
    similarity_scores = sorted(similarity_scores, key=lambda x: x[1], reverse=True)
    similarity_scores = similarity_scores[1:6]

    # Get the names index
    lucid_index = [i[0] for i in similarity_scores]

    # Return the top 5 most similar names
    return posts['title'].iloc[lucid_index]


print(recommend(6))
