#!/usr/bin/env perl
use warnings;
use strict;
use JSON;

my $server = 'http://troywill.com:4000';
my $register_ipv6 = '::ffff:192.0.2.128';
my $ios_device_identifier = 'HG:A4:UI:90';
my $ios_device_type_id = '1';
my $hips = 39;
my $bust = 39;
my $waist = 26;
my $height = 66;

my %user = (
	      user => {
		  register_email => 'troydwill@gmail.com',
		  register_ipv6 => $register_ipv6,
		  ios_device_identifier => $ios_device_identifier,
		  ios_device_type_id => $ios_device_type_id,
		  hips => $hips,
		  bust => $bust,
		  waist => $waist,
		  height => $height
    }
    );


while ( 1 ) {
  &menu;
  chomp( my $input = <STDIN> );
  &print_json_hash(\%user) if $input eq '1';
  &register_user if $input eq '2';
  &display_registered_users if $input eq '3';
  last if $input eq 'q';
  last if $input eq 'Q';
}

sub display_registered_users {
      my $curl_get_command = "curl --header 'Content-Type:application/json' --header 'Accept:application/json' --request GET $server/users 2>/dev/null";
      print "\n==> $curl_get_command\n";
      my $server_response= `$curl_get_command`;
      print "\n>>> Server JSON response <<<\n";
      print $server_response;
      my $perl_arrayref  = decode_json $server_response;
      print "==> $perl_arrayref <==\n";
      for my $href ( @{$perl_arrayref} ) {
	  print "id: $href->{'user'}->{'id'}, $href->{'user'}->{'register_email'}\n";
      }
}

sub print_json_hash {
    my $hash_ref = shift;
    my $json_text = encode_json $hash_ref;
    print $json_text;
}
 
sub register_user {
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
    print "|\tQ to quit\n";
  print "| 1. Show current User hash in JSON\n";
  print "| 2. Register a new User (POST JSON User hash to $server/users)\n";
  print "| 3. Display registered users\n";
  print "| Choice? ";
}
