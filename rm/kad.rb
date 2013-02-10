#!/usr/bin/ruby
require 'open-uri'
require 'cgi'
require 'rubygems'
require 'zip/zip'

cgi = CGI.new

beginning = Time.now

print "Content-type: text/html\r\n\r\n"
print <<EOF
<form method="post" action="/kad.rb">
   <input type="text" name="url"> <input type="submit" name="submit" value="Dload"><br>
</form>
EOF

urls = cgi.params['url'].to_s
if File.extname(urls)  == '.ram'
   album = urls.split('/') [-2] 
   songs = []

   open(urls).read.each_line do |url|
      song = url.split("/")[-1].chomp
      Zip::ZipFile.open(album+'.zip', Zip::ZipFile::CREATE) {
        |zipit|
        zipit.get_output_stream(song) { |f| f.puts open(url.chomp).read }
   } 
   end
end
# code block
puts "Time elapsed #{Time.now - beginning} seconds"
