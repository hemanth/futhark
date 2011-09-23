#!/usr/bin/python2.6
#
# Copyright [2011] Hemanth.HM
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#   http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import collections
import string

__authors__ = "Hemanth HM <hemanth.hm@gmail.com>"
__version__ = "1.0"

class MapReduce:
    """ Linear implementation of MapReduce.
    MapReduce is a software framework introduced by Google.
    """ 

    def map_it(self,lines):
        """ Returns a list of lists of the form [word,1]
            for each element in the list that was passed.
        """                
        return [[word, 1] for word in lines]

    def sort_it(self,wlist):
        """ Returns a list of list of the form [word,[partialcounts]] """
        res = collections.defaultdict(list)
        map(lambda w: res[w[0]].append(w[1]), wlist)
        return res.items()
    
    def map_reduce(self,wlist): 
        """ Returns a dict with word : count mapping """
        results = {}
        for res in self.sort_it(self.map_it(wlist)) :
            results[res[0]] = sum(res[1])
        return results
    
class SlurpFile:
    """ Simple class to get the file contents, after filtering punctuations 
        
    Attributes:
        fpath: Path to the file name.
    """
      
    def __init__(self,path):
        """ Inits the SlurpFile class with path to the file 
        Args:
            path: path to the file that needs to be read.
        """
        self.fpath = path

    def get_contents(self):
        """ Read the files and cleans it by removing the punctuations 
            and returns a list of words.
        """
        with open(self.fpath) as wfile:
            return ''.join(ch for ch in wfile.read() if ch not in set(string.punctuation)).split()

mr = MapReduce()

slurp = SlurpFile('/tmp/t')

result = mr.map_reduce(slurp.get_contents())

print result

