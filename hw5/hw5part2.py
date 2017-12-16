
# coding: utf-8

# In[13]:


def find_mysql_by_id(id):
    import mysql.connector
    cnx = mysql.connector.connect(user='root', password='123456', 
                                  host='127.0.0.1', 
                                  database='finalexamhw5')
    cursor = cnx.cursor()
    cursor.execute("select * from Master where playerID = '"+ id + "';")
    result = cursor.fetchall()
    cnx.close()
    return result


# In[45]:


def find_redis_by_id(id):
    import redis
    r = redis.StrictRedis(host = '127.0.0.1', port = 6379, 
                          charset = "utf-8", decode_responses = True)
    v = r.hgetall("players:"+id)
    return v


# In[83]:


def add_to_redis(id, data):
    import json
    data = data[0]
    temp = []
    for x in data:
        temp.append(json.dumps(x).strip('\"'))
    k = "players:" + temp[0]
    m = {"playerID" : temp[0], "birthYear" : temp[1], "birthMonth" : temp[2],
        "birthDay" : temp[3], "birthCountry" : temp[4], "birthState" : temp[5],
        "birthCity" : temp[6], "deathYear" : temp[7], "deathMonth" : temp[8],
        "deathDay" : temp[9], "deathCountry" : temp[10], "deathState" : temp[11],
        "deathCity" : temp[12], "nameFirst" : temp[13], "nameLast" : temp[14],
        "nameGiven" : temp[15], "weight" : temp[16], "height": temp[17], 
        "bats" : temp[18], "throws" : temp[19], "debut" : temp[20], 
        "finalGame" : temp[21], "retrolID" : temp[22], "bbrefID" : temp[23]}
    r.hmset(k,m)
    return


# In[93]:


def find_by_id(id):
    if find_redis_by_id(id) != {}:
        return find_redis_by_id(id)
    else:
        add_to_redis(id, find_mysql_by_id(id))
        return find_redis_by_id(id)


# In[94]:


find_by_id("aardsda01")


# In[95]:


find_by_id("aaronha01")


# In[96]:


find_mysql_by_id("aardsda01")


# In[97]:


find_redis_by_id("aardsda01")


# In[98]:


add_to_redis("aaronto01", find_mysql_by_id("aaronto01"))


# In[99]:


find_by_id("aasedo01")

