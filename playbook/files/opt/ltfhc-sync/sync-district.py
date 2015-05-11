#!/usr/bin/env python

# Read all the documents in uucppublic
# Move document to local "processed" folder if last_seq (file version) < localdoc (localreplica current seq)
# Apply diff to local replica : emr_{{source}} (assume district has been bootstrapped)

# Gets the last sequence number in the _local/last document. 
# Gets all data changes since that document.

#Importing modules
import requests
import json

changes = "https://localhost/emr_{{ansible_hostname}}/_changes"
localdoc = "https://localhost/emr_{{ansible_hostname}}/_local/last"

r = requests.get(localdoc, verify=False)
#dir(r.json())
seq = {'seq':0}

changesparams = {
  "filter":"emr/user_data",
  "include_docs": "true",
  "since": seq["seq"]
  }

r = requests.get(changes,params=changesparams, verify=False)

b = {}

for i in r.json()['results']:
   b[i['id']] = [i['changes'][0]['rev']]

# print json.dumps(b, sort_keys=True, indent=4, separators=(',', ': '))
print json.dumps(r.json())

# Save output, copy to remote end, post to _rev_diff URL
# http://wiki.apache.org/couchdb/HttpPostRevsDiff
