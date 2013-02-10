#!/usr/bin/perl -w
use strict;
use CGI qw(:standard);
use warnings; 
use LWP::Simple qw(!head);
use File::Basename;
use Archive::Zip;

my $now = time;
print "Content-Type: text/html\n\n";
print<<'EOF';
<form method="post" action="./kad.pl">
   <input type="text" name="url"> <input type="submit" name="submit" value="Dload"><br>
</form>
EOF

my $url = param('url');
if(defined $url and head($url)){ 
   #if(isvalid($url))
   #{
      my @pieces = (split /\//,$url);
      my $album = $pieces[-2];
      my $urls = get($url);
      my @songs = ();
      foreach my $url (split /\n/, $urls) {
	   push(@songs,basename($url));
           getstore($url,basename($url));
      }   
    
      my $compressor = Archive::Zip->new();

     foreach my $song (@songs)
     {
       $compressor->addFile($song);
     }

     $compressor->writeToFileNamed($album.'.zip');
     print '<p>Download must start automatically, else click <a href=./'.$album.'.zip>Songs</a> <br /><b> NOTE : The file will be alive for the next 2 hours!</b></p>';
     print '<iframe width="1" height="1" frameborder="0" src=./'.$album.'.zip></iframe>';
     $now = time - $now;
     #printf("\n\nTotal running time: %02d:%02d:%02d\n\n", int($now / 3600), int(($now % 3600) / 60),int($now % 60));

#   }
}
