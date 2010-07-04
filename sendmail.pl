#!/usr/local/bin/perl -w

use MIME::Lite;

$PLAINFILE="/tmp/text";
$BINFILE="/tmp/binary";
$SUBJECT="Attachmented";
$MAILTO="First.last@example.com";

#Meta Msg creation
$msg = new MIME::Lite 
   From    => "$ENV{LOGNAME}",
   To      => "$MAILTO",
   Subject => "$SUBJECT",
   Type    => 'multipart/mixed';
        
# Attach
attach $msg 
   Type     => 'text/plain',   
   Path     => "$PLAINFILE";
attach $msg 
   Type     => 'application/octet-stream',
   Encoding => 'base64',
   Path     => "/tmp/$BINFILE",
   Filename => "$BINFILE";

# Send message to sendmail

open (SENDMAIL, "| /usr/lib/sendmail -t -oi");
$msg->print(\*SENDMAIL);
close(SENDMAIL);
