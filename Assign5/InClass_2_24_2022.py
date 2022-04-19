#!/usr/bin/env python
# coding: utf-8

# In[ ]:


#We selected an API that returns weekly weather conditions.
#What is the daily tempature change for each day in our data? 
#What days are above freezing? 


# In[51]:


import requests
import json
import pandas as pd # data analysis and manipulation
import numpy as np #numerical and scientific computing
from sklearn import datasets # free inbuilt datasets

url="https://weatherdbi.herokuapp.com/data/weather/{madison}"
w_r=requests.get(url)
print(w_r.text)


# In[57]:


w_data=json.loads(w_r.text)
w_new_columns = ['Day', 'Comment', 'High', 'Low', 'Location', 'DailyTempChange']
w_df = pd.DataFrame(columns=w_new_columns)

print(w_new_columns)


# In[58]:


for x in w_data['next_days']:
    w_df.loc[len(w_df)] = [x['day'],x['comment'],x['max_temp']['f'],x['min_temp']['f'], 'Madison', '']

display(w_df)


# In[59]:


#Aggregate data
for x in w_df:
    w_df['DailyTempChange'] = w_df['High'] - w_df['Low']

display(w_df)


# In[62]:


#Drop unwanted columns
w_df = w_df.drop(columns=['Low','DailyTempChange'])
display(w_df)


# In[63]:


#Clean any unwanted data
#We want to drop data that are below freezing
w_df = w_df.drop(w_df[w_df['High'] < 32].index)

display(w_df)


# In[ ]:


#For our second dataset we selected avacado prices/sale information from 2015 to 2020 from a CSV file.
#What percentage of total bags are small bags?
#What was the average price of avacados for only year 2020?


# In[70]:


a_df = pd.read_csv("data/avocado-updated-2020.csv")
a_df.head(100)


# In[72]:


#Drop unwanted columns
a_df = a_df.drop(columns=['4046','4225','4770'])
a_df.head(100)


# In[78]:


#add column for percentage of small bags compared to the total
a_df['SmallBags%ToTotalBags'] = ''
a_df.head(100)


# In[81]:


#Aggregate data
for x in a_df:
    a_df['SmallBags%ToTotalBags'] = a_df['small_bags'] / a_df['total_bags']
a_df.head(100)


# In[82]:


a_df.describe()


# In[84]:


#remove unwanted data (we only want 2020)
a_df = a_df.drop(a_df[a_df['year'] != 2020].index)
a_df.describe()


# In[ ]:




