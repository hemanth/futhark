#!/usr/bin/python
import cgi
import time
import cgitb 
import urllib
import zipfile

cgitb.enable()

now = time.clock()

print "Content-type: text/html"
print

print """
<form method="post" action="./kad.py">
   <input type="text" name="url"> <input type="submit" name="submit" value="Dload"><br>
</form>
"""

form = cgi.FieldStorage()
url = form.getvalue("url", "None")

if url != "None":
    type = url [ -3: ]
    album = url.split('/')[-2]
    urls = urllib.urlopen(url)  
    songs = []
    
    for url in urls:
	song = url.split("/")[-1]
        urllib.urlretrieve(url,song)
	songs.append(song)

    zipit = zipfile.ZipFile(album+'.zip', 'w')    

    for song in songs:
        zipit.write(song)   

print time.clock() - now
