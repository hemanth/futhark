#Author : Hemanth H.M hemanth.hm@gmail.com
#Licence : GNU GPLv3
#
class RandomGenerate
attr_reader :generated

def initialize(len)
@len = len
@generated = []
end

def get
begin
rstr = rand(36 ** @len - 1).to_s(36).rjust(@len, "0")
end while @generated.member? rstr

@generated << rstr

rstr
end
