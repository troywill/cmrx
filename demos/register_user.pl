#!/usr/bin/env perl
use warnings;
use strict;
use JSON;

my $server = 'http://troywill.com:4000';

while ( 1 ) {
  &menu;
  my $input = <STDIN> ;
  chomp $input;
  print "==> $input\n";
  &register_user if $input eq '1';
  last if $input eq 'q';
  last if $input eq 'Q';
}


sub register_user {
  print "Email address? "; chomp ( my $email_address = <STDIN> );
  print "Waist measurement in inches? "; chomp ( my $waist = <STDIN> );
  my %user = ('register_email', $email_address);
  my %Hash = (
	      user => {
		       register_email => $email_address,
		       waist => $waist
		      }
	     );

  my $json_text = encode_json \%Hash;
  my $curl_post_command = "curl --header 'Content-Type:application/json' --header 'Accept:application/json' --data '$json_text' $server/users 2>/dev/null";
  print "==> $curl_post_command\n\n";
  my $json_server_response = `$curl_post_command`;
  print "\n>>> Server JSON response <<<\n";
  print $json_server_response;
  print "\n\n";
}

sub menu {
  print "\nQ to quit\n";
  print "1. Register a new user\n";
  print "Choice? ";
}

