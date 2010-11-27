#!/usr/bin/env python
# Find invisible gmail
# Foundu.py
# Author Hemanth.HM
# Site : www.h3manth.com
# Licensed under GNU GPL Version 3

import xmpp
 
# Edit the below as per your need
ID = "user@gmail.com"
PASS = "scrt"
Gserver = "gmail.com"

# Get the jabber id of the user from his email id 
jabberId=xmpp.protocol.JID(ID)

# Client instnace 
Node=xmpp.Client(jabberId.getDomain(),debug=[])
 
# Check connection
if not Node.connect((Gserver,5222)):
    print "Could not connect to",Gserver

# Authentication of the user
if not Node.auth(jabberId.getNode(),PASS):
    print "Please check your password"

# Send roster request and initial <presence/>. 
Node.sendInitPresence(requestRoster=1)

# Handler  
def isVisible(con, event):
   if event.getType() == 'unavailable':
     print event.getFrom().getStripped()

# Register the defined handler.
# Register user callback as stanzas handler of declared type.
Node.RegisterHandler('presence', isVisible)

while Node.Process(1):
  pass
