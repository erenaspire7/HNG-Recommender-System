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

checked the comments table (it was empty)
id	post_id	user_id	comment	created_at	updated_at

checking out the contact_settings table
	id	user_id	email	display_message	created_at	updated_at
0	1	78	emmanuelezenwigbo@gmail.com	Web Developer | Digital Marketer	None	None
1	2	90	dward009@gmail.com	Call me	None	None
2	3	53	apeji93@gmail.com	Yossi	None	None
3	4	133	ireabueke@gmail.com	None	None	None
4	5	92	bindas.fs@gmail.com	Contact me on that email	None	None
5	6	138	detounmed@gmail.com	LUCID Tester	None	None
6	7	130	okakosomano@gmail.com	Hit me up, whenever.	None	None
7	8	177	mubbs24@gmail.com	Call me on	None	None
8	9	73	charlesokoliocha@gmail.com	Send a mail.\r\n\r\nThanks	None	None
9	10	160	olaitanaderoju@gmail.com	Wanna know more?\r\n\r\nreach out anytime	None	None
10	11	123	geomaggi91@gmail.com	Adeniran Margaret Adenike	None	None
11	12	120	iburity19@gmail.com	None	None	None
12	13	121	chubukass@gmail.com	Coding is the new food\r\n08066702567	None	None
13	14	142	reeta.nzere@gmail.com	All set	None	None
14	15	81	davidadigwu@gmail.com	None	None	None
15	16	150	calabarspice@gmail.com	None	None	None
16	17	238	eyubechristian@gmail.com	Phone number	None	None
17	18	220	corperevon@gmail.com	Hello people. \r\n\r\nYou are welcome to me bl...	None	None
18	19	62	giftomodu20@gmail.com	Reach out	None	None
19	20	143	siyanbolafaruk@gmail.com	Follow me on twitter @siyfa00	None	None
20	21	131	onwujiubaugouo@gmail.com	None	None	None
21	22	77	oiadebayo11@student.lautech.edu.ng	Display text	None	None
22	23	173	onsearinahud@gmail.com	Remote	None	None
23	24	70	josephachonu@gmail.com	keep your messages coming	None	None
24	25	47	hi@meedul.com	twitter: @ubarab\r\nweb: www.meedul.com	None	None
25	26	218	aphatheology@gmail.com	You can also get to me through Whatsapp: 08107...	None	None
26	27	175	rajilat1000@gmail.com	None	None	None
27	28	255	shodiyaade@gmail.com	ME!	None	None
28	29	115	jemimah.vb@gmail.com	None	None	None
29	30	258	sootersaalu@gmail.com	#lucidfeedback\r\n\r\nI can't edit my username...	None	None
...	...	...	...	...	...	...
219	220	1754	mariamadebola28@gmail.com	maryam_bola	None	None
220	221	534	ayobamiolugboyega@gmail.com	None	None	None
221	222	1776	egbobright@gmail.com	Learning to create	None	None
222	223	1802	musaharold@gmail.com	The earth is for US tot explore.........	None	None
223	224	1808	rutherford.ejim@gmail.com	Email: rutherford.ejim@gmail.com\r\nWhatsapp: ...	None	None
224	225	1818	lateef9816@gmail.com	My Email Address	None	None
225	226	1122	odekunlejj@gmail.com	None	None	None
226	227	1844	amadiprecious899@gmail.com	Curiosity is Life itself???	None	None
227	228	691	tiberiusmairura90@gmail.com	It is about what you think about yourself that...	None	None
228	229	707	othanksgiving@gmail.com	Hey	None	None
229	230	1007	unuebhojude@gmail.com	Phone number: +2348076568004	None	None
230	231	1904	adebayorilerioluwa@gmail.com	None	None	None
231	232	666	etolope94@gmail.com	None	None	None
232	233	1915	ucshaya@gmail.com	At your service	None	None
233	234	1921	ihekwoabamn@gmail.com	None	None	None
234	235	1220	osisindu.awesome@gmail.com	Follow me on Twitter: @Awesocode	None	None
235	236	1946	anthony@osawere.com	Osawere O. Anthony\r\nCreative Developer, Brux...	None	None
236	237	1977	tabafor@gmail.com	This is my primary contact email.	None	None
237	238	577	mashdon77@gmail.com	Talk to Marshal	None	None
238	239	20	albertoboh@yahoo.com	None	None	None
239	240	1798	iamduq@gmail.com	Twitter.com/theduq	None	None
240	241	799	ifeoluwagodishere@gmail.com	Ifeoluwa Oyekanmi	None	None
241	242	2065	akinsondan@gmail.com	Nice design	None	None
242	243	2112	tosine1790@gmail.com	O2bid	None	None
243	244	1543	lindalily50@gmail.com	Linda	None	None
244	245	2098	fortunereal90@gmail.com	Your blogging superhero	None	None
245	246	2143	idrisade.eedris@gmail.com	Hi, I'm Idris Idris, a python developer (begin...	None	None
246	247	2150	tbitopsi@gmail.com	Whatsapp: 07031213263	None	None
247	248	2256	oluwadarasiwa@gmail.com	None	None	None
248	249	2263	popoolaolusola92@gmail.com	Popson	None	None
249 rows × 6 columns









