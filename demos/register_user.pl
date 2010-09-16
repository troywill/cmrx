#!/usr/bin/env perl
use warnings;
use strict;
use JSON;

my $server = 'http://troywill.com:4000';
my $iphone_id = 'HG:A4:UI:90';
my $register_ip = '0.0.0.0';

my %user = (
	      user => {
		       register_email => 'troydwill@gmail.com',
		       register_ip => $register_ip,
		       iphone_id => $iphone_id,
		       hips => 39,
		       bust => 39,
		       waist => 26,
		       height => 66
    }
    );


while ( 1 ) {
  &menu;
  my $input = <STDIN> ;
  chomp $input;
  print "==> $input\n";
  &print_json_hash(\%user) if $input eq '1';
  &register_user if $input eq '2';
  last if $input eq 'q';
  last if $input eq 'Q';
}


sub print_json_hash {
    my $hash_ref = shift;
    my $json_text = encode_json $hash_ref;
    print $json_text;
}
 
sub register_user {
  print "Email address? "; chomp ( my $email_address = <STDIN> );
  print "Waist measurement in inches? "; chomp ( my $waist = <STDIN> );
  my %Hash = (
	      user => {
		       register_email => $email_address,
		       waist => $waist
		      }
	     );

  my $json_text = encode_json \%user;
  my $curl_post_command = "curl --header 'Content-Type:application/json' --header 'Accept:application/json' --data '$json_text' $server/users 2>/dev/null";
  print "==> $curl_post_command\n\n";
  my $json_server_response = `$curl_post_command`;
  print "\n>>> Server JSON response <<<\n";
  print $json_server_response;
  print "\n\n";
}

sub menu {
    print "\n\n+-------------- Prescription RX Menu --------------+\n";
    print "| Q to quit\n";
  print "| 1. Print user hash in JSON\n";
  print "| 2. Register a new user\n";
  print "| Choice? ";
}
