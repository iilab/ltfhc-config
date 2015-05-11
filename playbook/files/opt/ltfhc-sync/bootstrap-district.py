#!/usr/bin/env python

# Creates local replica for all clinics
# Saves the last sequence number in the _changes feed to a _local document 
# for later retrieval. This only needs to be run once

#Importing modules
import requests
import json

katombo = "https://" + os.environ['AUTH'] + ":localhost/emr_katombo"
katondo = "https://" + os.environ['AUTH'] + ":localhost/emr_katondo"
kimena = "https://" + os.environ['AUTH'] + ":localhost/emr_kimena"
kitoke = "https://" + os.environ['AUTH'] + ":localhost/emr_kitoke"
wimbi = "https://" + os.environ['AUTH'] + ":localhost/emr_wimbi"
localdoc = "/_local/last"

newdata = {"_id":"_local/last","seq":0}

r = requests.put(katombo, data=, verify=False)
print r.json()
r = requests.put(katombo + localdoc, data=json.dumps(newdata), verify=False)
print r.json()