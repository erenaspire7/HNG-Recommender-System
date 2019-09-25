#pylint:disable=W0312

import csv

def getPosts(id=1):
	posts, id = [], str(id)
	with open("lucid/lucid_table_posts.csv","r",encoding='latin-1') as postsFile:
		allPosts = csv.reader(postsFile, delimiter=",")
		head = []
		for (index, postArr) in enumerate(allPosts):
			if index==0:
				head = postArr
				continue
			if postArr[1] == id:
				obj = {}
				for (i, item) in enumerate(head):
					obj[item] = postArr[i]
				posts.append(obj)
	return posts
	

def recommendPosts(id, max=5):
	id, recommended = str(id), []
	with open("lucid/lucid_table_users.csv", "r",encoding='latin-1') as usersFile:
		users = csv.reader(usersFile, delimiter=",")
		user, rows = None, []
		for (index,row) in enumerate(users):
			if index == 0:
				rows = row
			if row[rows.index("id")] == id:
				user = row
		if user == None:
			return []
		with open("lucid/lucid_table_following.csv", "r",encoding='latin-1') as follsFile:
			folls = csv.reader(follsFile, delimiter=",")
			follsCount = {}
			userFolls = {"active" : [], "inactive" : []}
			for (index, row) in enumerate(folls):
				if row[0] == id:
					userFolls["active" if row[2]=="1" else "inactive"].append(row[1])
				if not row[0] == "my_id":
					if str(row[0]) not in follsCount:
						follsCount[str(row[0])] = 0
					follsCount[str(row[0])] += 1
			for uf in userFolls:
				for ufId in userFolls[uf]:
					recommended += getPosts(id=ufId)
			if len(recommended) >= max:
				return recommended[0:max:]
			sortedByFolls = []
			for k,v in sorted(follsCount.items(), key=lambda i :i[1], reverse=True ):
				sortedByFolls.append([k,v])
			for s in sortedByFolls:
				if len(recommended) >= max:
					break
				if s[0] in userFolls["active"] or s[0] in userFolls["inactive"]:
					continue
				recommended += getPosts(id=s[0])
		return recommended[0:max:]


def recommendFollowers(id, max=5, returnFollowers=False):
	recommended, id = [], str(id)
	tempFolls, folls, follsCount = [],[],{}
	def getUsernames(folls):
		newFolls = []
		with open("lucid/lucid_table_users.csv", "r") as usersFile:
			users = csv.reader(usersFile, delimiter=",")
			users = list(users)
			for f in folls:
				newFolls.append(users[f][2])
		return newFolls
	with open("lucid/lucid_table_following.csv", "r",encoding='latin-1') as follsFile:
		follsCsv = csv.reader(follsFile, delimiter=",")
		for (index,rows) in enumerate(follsCsv):
			if rows[0] == id:
				tempFolls.append(rows[1])
			if index != 0 and recommendFollowers != True:
				if not rows[0] in follsCount:
					follsCount[rows[0]] = 0
				follsCount[rows[0]] += 1
		if returnFollowers:
			return tempFolls
	for temp in tempFolls:
		t_tempFolls = recommendFollowers(temp, returnFollowers=True)
		for t_item in t_tempFolls:
			if int(t_item) not in folls:
				folls.append(int(t_item))
	if len(folls) >= max:
		return getUsernames( folls[0:max:] )
	sortedByFolls = []
	for (f_key, f_val) in sorted(follsCount.items(), key=lambda f : f[1], reverse=True):
		if not int(f_key) in folls:
			folls.append(int(f_key))
	return getUsernames( folls[0:max:] )

r = recommendPosts(1, max=5) # <- returns 5 posts recommended for user 1

r2 = recommendFollowers(3, max=50) # <- returns 50 followers recommended for user 3

posts = getPosts(6) # < - returns all the posts by user 6



"""
The following CSVs were used :
	
lucid_table_users
lucid_table_following
lucid_table_posts
"""
