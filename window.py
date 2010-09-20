#!/usr/bin/evn python

import pygtk
# Check for minmial requirement of version 2.0
pygtk.require('2.0')
import gtk

class Base:
    def destroy(self,widget, data=None):
	# This gets printed in the console
	print "Have a nice day"

	# Terminate window on destroy singal
	gtk.main_quit()

    def hideit(self,widget, data=None):
	# On click of second button, hide the exit button
	self.button1.hide()

    def showit(self,widget, data=None):
	# On click of the third button, show the exit button
	self.button1.show()

    # init 
    def __init__(self):

        # Create a TOPLEVEL WINDOW
	self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)

	# Set the postion of WINDOW to center
	self.window.set_position(gtk.WIN_POS_CENTER)

	# Set window size
	self.window.set_size_request(600,400)
	
	# Simple sample button with text as EXIT	
	self.button1 = gtk.Button("EXIT")
	# On button EXIT clicked destory the window
	self.button1.connect("clicked",self.destroy)

	# Simple sample button with text as EXIT	
	self.button2 = gtk.Button("Hide")
	# On button EXIT clicked destory the window
	self.button2.connect("clicked",self.hideit)

	# Simple sample button with text as EXIT	
	self.button3 = gtk.Button("Show")
	# On button EXIT clicked destory the window
	self.button3.connect("clicked",self.showit)

	# A simple container
	fixed = gtk.Fixed()
	
	# Put buttons to the container
	fixed.put(self.button1,20,30)
	fixed.put(self.button2,100,30)
	fixed.put(self.button3,150,30)

	# Add fixed container to the main window 
	self.window.add(fixed)
	# Show the created window, button...all 
	self.window.show_all()
	# Connect destroy singal of the window to destory method [X]
	self.window.connect("destroy",self.destroy)
	
    def main(self):
        gtk.main()

if __name__ == "__main__":
    base = Base()
    base.main()

