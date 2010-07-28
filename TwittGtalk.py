import sys
import warnings
from xmpp import *
import urllib

# Don you dare warn me!
warnings.filterwarnings("ignore") 

#### EDIT THE BELOW ####
GUSERNAME = "hemanth.hm"
GPASSWORD = "YOU_KNOW_IT"
RESOURCE = "gmail.com"

TUSER="hemanth_hm"
TPASS="DON_YOU_KNOW?"
#######################

class Gtweet:
	def __init__(self, stats=None):
		self.stats = stats
	def gstat(self):
		cl=Client(server='gmail.com',debug=[])
		if not cl.connect(server=('talk.google.com',5222)):
			raise IOError('Can not connect to server.')
		if not cl.auth(GUSERNAME, GPASSWORD, RESOURCE):
		    raise IOError('Can not auth with server.')
		cl.send(Iq('set','google:shared-status', payload=[
				Node('show',payload=['status']),
				Node('status',payload=[self.stats])
		]))
		cl.disconnect()
	
	def twit(self):
		try:
			data = urllib.urlencode({"status" :self.stats})
			res = urllib.urlopen("http://%s:%s@twitter.com/statuses/update.xml" % (TUSER,TPASS),data)
		except Exception, why:
			print str(why)

def main():
	status = raw_input("Type in your status: ")
	gt = Gtweet(status)
	gt.twit()
	gt.gstat()

if __name__ == "__main__":
	main()


