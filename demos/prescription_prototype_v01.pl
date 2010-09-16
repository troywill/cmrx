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



sub menu {
    print "\n\n+-------------- Prescription RX Menu --------------+\n";
    print "|\tQ to quit\n";
  print "| 1. Show current User hash in JSON\n";
  print "| 2. Edit User data\n";
  print "| 3. Register a new User (POST JSON User hash to $server/users)\n";
  print "| 4. Retrieve prescription .zip file\n";
  print "| 5. Display registered users\n";
  print "| Choice? ";
}

while ( 1 ) {
  &menu;
  chomp( my $input = <STDIN> );
  &print_json_hash(\%user) if $input eq '1';
  &edit_user_hash if $input eq '2';
  &register_user if $input eq '3';
  &retrieve_prescription if $input eq '4';
  &display_registered_users if $input eq '5';
  last if $input eq 'q';
  last if $input eq 'Q';
}


sub edit_user_hash {
    print "Email? "; chomp( my $email = <STDIN> ); $user{user}{register_email} = $email;
    print "Hips (e.g. 39) ? "; chomp( my $hips = <STDIN> ); $user{user}{hips} = $hips;
    print "Bust (e.g. 39) ? "; chomp( my $bust = <STDIN> ); $user{user}{bust} = $bust;
    print "Waist (e.g. 26) ? "; chomp( my $waist = <STDIN> ); $user{user}{waist} = $waist;
    print "Height (e.g. 66) ? "; chomp( my $height = <STDIN> ); $user{user}{height} = $height;
}

sub display_registered_users {
    print "\n+-----------------------------------------------------------\n";
    print "| Registered Users, viewable at $server/users\n";
    print "| or $server/users.json\n";
    print "| or $server/users.xml\n";
    print "+------------------------------------------------------------n";

      my $curl_get_command = "curl --header 'Content-Type:application/json' --header 'Accept:application/json' --request GET $server/users 2>/dev/null";
      print "\n==> $curl_get_command\n";
      my $server_response= `$curl_get_command`;
      print "\n>>> Server JSON response <<<\n";
      print $server_response;
      my $perl_arrayref  = decode_json $server_response;
      print "==> $perl_arrayref <==\n";
      for my $href ( @{$perl_arrayref} ) {
	  print "id: $href->{'user'}->{'id'}, $href->{'user'}->{'register_email'}, registered at $href->{'user'}->{'created_at'}\n";
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

