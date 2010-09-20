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

    def relable(self,widget,data=None):
	# On click of the fourth button, relable the label
	if self.label1.get_text() == "Relabled":
	    self.label1.set_text("Relabled!! Again")
	else:
	    self.label1.set_text("Relabled")

    def textchange(self,widget,data=None):
	# As text is change in the textbox, the window title is change
	self.window.set_title(self.textbox.get_text())


    # init 
    def __init__(self):

        # Create a TOPLEVEL WINDOW
	self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)

	# Set the postion of WINDOW to center
	self.window.set_position(gtk.WIN_POS_CENTER)

	# Set window title
	self.window.set_title("Sample GTK window")

	# Set tool tip
	self.window.set_tooltip_text("This a sample GTK window")

	# Set window size
	self.window.set_size_request(600,100)
	
	# BUTTON1
	# Simple sample button with text as EXIT	
	self.button1 = gtk.Button("EXIT")
	# On button EXIT clicked destory the window
	self.button1.connect("clicked",self.destroy)
	# Set tool tips
	self.button1.set_tooltip_text("This button will close this window")

	# BUTTON2
	# Simple sample button with text as EXIT	
	self.button2 = gtk.Button("Hide")
	# On button EXIT clicked destory the window
	self.button2.connect("clicked",self.hideit)
	# Set tool tips
	self.button2.set_tooltip_text("This button will hide the exit button")


	# BUTTON3
	# Simple sample button with text as EXIT	
	self.button3 = gtk.Button("Show")
	# On button EXIT clicked destory the window
	self.button3.connect("clicked",self.showit)
	# Set tool tips
	self.button3.set_tooltip_text("This button will show the exit button")

	# BUTTON4
	self.button4 = gtk.Button("Relable")
	self.button4.connect("clicked",self.relable)
	
	# Create a simple label	
	self.label1 = gtk.Label("This is a label")
	
	#TEXTBOX, connect textchange method, for the signal changed 
	self.textbox = gtk.Entry()
	self.textbox.set_text("As you type see the window title")
	self.textbox.connect("changed",self.textchange)


	"""
	# A simple container
	fixed = gtk.Fixed()
	
	# Put buttons to the container
	fixed.put(self.button1,20,30)
	fixed.put(self.button2,100,30)
	fixed.put(self.button3,150,30) 
	fixed.put(self.label1,200,100) """

	"""
	Comment this to section and uncomment fxied container,
	to see how Fixed works. One can change VBox to HBox to see th difference	"""
	
	# HBox 
	self.box1 = gtk.HBox()
	self.box1.pack_start(self.button1)
	self.box1.pack_start(self.button2)
	self.box1.pack_start(self.button3)
	self.box1.pack_start(self.button4)
	# self.box1.pack_start(self.textbox)
	# self.box1.pack_start(self.label1)
	# Above was added to VBox to make it better
						
	# VBox	
	self.box2 = gtk.VBox()
	# Pack HBox in VBox
	self.box2.pack_start(self.box1)
	self.box2.pack_start(self.label1)
	self.box2.pack_start(self.textbox)

	# Add fixed container to the main window 
	# self.window.add(fixed)
	# If box enabled, uncomment the above and comment below line
	self.window.add(self.box2)
	# Show the created window, button...all 
	self.window.show_all()
	# Connect destroy singal of the window to destory method [X]
	self.window.connect("destroy",self.destroy)
	
    def main(self):
        gtk.main()

if __name__ == "__main__":
    base = Base()
    base.main()

