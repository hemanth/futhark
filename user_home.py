#!/usr/bin/evn python

# Getting the home path:
import os
 
home = os.curdir                      
 
if 'HOME' in os.environ:
    home = os.environ['HOME']
elif os.name == 'posix':
    home = os.path.expanduser("~/")
elif os.name == 'nt':
    if 'HOMEPATH' in os.environ and 'HOMEDRIVE' in os.environ:
        home = os.environ['HOMEDRIVE'] + os.environ['HOMEPATH']
else:
    home = os.environ['HOMEPATH']

# Getting user:
for name in ('LOGNAME', 'USER', 'LNAME', 'USERNAME'):
    user = os.environ.get(name)
    if user:
        return user
 
     # If not user from os.environ.get()
     import pwd
     return pwd.getpwuid(os.getuid())[0]

