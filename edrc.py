#!/usr/bin/evn python
"""
This utility helps to edit the dotrc file of the current shell,
then invoke the same, there by avioding the overhead on the user
to source rc or exec $SHELL each time there is an addition in 
the rc """


__author__ = "Hemanth HM"
__email__ = "hemanth.hm@gmail.com"
__license__ = "GPLV3"

import os
import sys
import subprocess

class edrc:

	def edit(self,shell):
		 ''' If the shell is sh, exit as it does not use rc '''
		 shell=os.path.basename(shell)
		 if shell == 'sh' :
			 print "sh does not supprot rc!"
			 sys.exit(1)

		 ''' Set the rc file path '''
		 if shell == 'fish':
			rc='~/.fish'
		 rc='~/.'+shell+'rc'

		 ''' Else select a sensible editor '''
		 editor = "vi"
		 if "VISUAL" in os.environ:
			editor = os.environ["VISUAL"]
		 elif "EDITOR" in os.environ:
			editor = os.environ["EDITOR"]

		 ''' Edit the rc '''
		 subprocess.call ([editor,os.path.expanduser(rc)])

		 ''' Reinvoke the shell '''
		 print "Reinvoking the shell"
		 os.system(shell)
	
		
	def get_opt(self):
		''' Get the current shell from the process tree 
		*bad* way to get the pid of from which the script was forked 
		shell = os.popen("ps -o comm= -p" + str(os.getppid())).readlines()[0].splitlines() '''
		
		''' Get all the valid login shells '''
		shells = list()
		with open('/etc/shells') as f:
			for line in f:
				line = line.split('#', 1)[0].strip()
				if not line:
					continue
				if os.path.exists(line):
					shells.append(line)


		''' Enumerate over them to print the options '''
		for i,shell in enumerate(shells):
			print '%i %s %s'% (i+1,"=>",shell)
		
		''' Read input option '''
		try:
			rc=raw_input('Select the shell for which you need to edit/create rc [ Any other key to exit ] : ')
		
		''' Trap keyboard Interrupts '''		
		except (KeyboardInterrupt, SystemExit):
			print "\n"
			sys.exit(1)

		''' Validate inputs '''
		if rc >= len(shells):
			sys.exit(1)
 
		try:
			int(rc)
		except ValueError, e:
			sys.exit(1)
		
	
		''' If all clear edit '''
		self.edit(shells[rc-1])
		
def main():
	ed = edrc()
	ed.get_opt()
 
if __name__ == "__main__":
    main()

