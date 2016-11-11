from __future__ import division
import scipy as sp
import numpy as np
import os,sys, re
import json
import matplotlib.pyplot as plt
from operator import sub

APPS=['com.accuweather.android', 'com.facebook.katana', 'com.nytimes.android', 'org.npr.android.news']
DIR='lunch'

app_name=[]
app_launch={}
app_ts={}
app_result={}
app_final={}
app_err={}

for f in os.listdir('./'+DIR+'/'):
    #print f
    if f.startswith('input_'):
	#print "where"
        app=f.replace('input_timings_lunch_','').replace('.txt', '')
	#print app
	app_name.append(app)
        if not app in app_launch:
            app_launch[app]=[]
        for line in open('./'+DIR+'/'+f):
            app_launch[app].append(long(line.strip().split(' ')[2]))
	    
        continue
    app=f.replace('logcat_', '')
    app=app[:app.find('_')]
    #print app

    if not app in app_ts:
        app_ts[app]=[]
    for line in open('./'+DIR+'/'+f):
	last=line
    raw_json=last.strip().split('{')[1]
    raw_json='{'+raw_json
    j=json.loads(raw_json)
    if not j['AppName'] in APPS:
        continue
    app_ts[app].append(long(j['timestamp']))
    app_ts[app]=sorted(app_ts[app])


for apps in app_name:
	outname=apps
	outfile=open(outname,'w')
	A=app_ts[apps]
	B=app_launch[apps]
	app_result[apps]=map(sub, A, B)
	#print A
	#print B
	#print app_result[apps]
	for num in range(0,6):
		app_final[num]=[]
		app_err[num]=[]
	for i in range(0, 30):
		#print i	
		app_final[i%6].append(app_result[apps][i])
	for num in range(0,6):
		#print min(app_final[num])
		app_err[num].append(sum(app_final[num])/len(app_final[num]))
		app_err[num].append(min(app_final[num]))
		app_err[num].append(max(app_final[num]))
		for obs in range(0,3):
			outfile.write(str(app_err[num][obs])+' ')
		outfile.write('\n')


