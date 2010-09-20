#!/usr/bin/evn python

import pygtk
# Check for minmial requirement of version 2.0
pygtk.require('2.0')
import gtk

class Base:
    def destroy(self,widget, data=None):
	print "Have a nice day"
	# Terminate window on destroy singal
	gtk.main_quit()

    # init 
    def __init__(self):
        # Create a TOPLEVEL WINDOW
	self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
	# Set the postion of WINDOW to center
	self.window.set_position(gtk.WIN_POS_CENTER)
	# Show the created window 
	self.window.show()
	# Connect destroy singal of the window to destory method [X]
	self.window.connect("destroy",self.destroy)
	
    def main(self):
        gtk.main()

if __name__ == "__main__":
    base = Base()
    base.main()

