#!/usr/bin/env perl
use warnings;
use strict;
use LWP::UserAgent;
use JSON;

my $host = 'http://stylerx.ath.cx';
my $api_key = '784da8554937a966ec97aec8ed1ec659e25e334b';
my $url = 'http://stylerx.ath.cx/users/1.json?api_key=784da8554937a966ec97aec8ed1ec659e25e334b';

my $ua = LWP::UserAgent->new();
my $body = $ua->get($url);
print keys%{$body};
print "==> ${$body}{_msg}\n";
print "==> ${$body}{_content}\n";

exit;
# $ua->default_header("HTTP_REFERER" => 'localhost' );
# my $body = $ua->get($url);

# # process the json string
# my $perl_scalar = from_json($body->decoded_content);
# print `date`;
# print "Keys: ", keys %{$perl_scalar}, "\n";
# print ${$perl_scalar}{'user'}{'name'}, "\n";

my %hash_of_hash = ( user => { name => 'Tracy' } );
my $json_text = encode_json \%hash_of_hash;

# my $response = $ua->(  my $curl_post_command = "curl --header 'Content-Type:application/json' --header 'Accept:application/json' --data '$json_text' $server/users 2>/dev/null";


my $response = $ua->post ( "$host/users", Content => $json_text, 'Content-Type' => 'application/json' );
print "==> $response <==\n";

$response = $ua->get ( "$host/users/1.xml&api_key=784da8554937a966ec97aec8ed1ec659e25e334b", Content => $json_text, 'Content-Type' => 'application/json' );

print "Keys: ", keys %{$response}, "\n";
print "<Values>", values %{$response}, "</Values>\n";

print "-------------------------------------------\n";

for my $key (keys %{$response}) {
    print "$key => ${$response}{$key}\n";
}

print "------- headers ----------\n";
my $hash_ref = ${$response}{_headers};
print keys %{$hash_ref};

for my $key (keys %{$hash_ref}) {
    print "$key => ${$response}{$key}\n";
}

# Or if you need to send HTTP headers:

#  $response = $browser->post( $url,
#    [
#      formkey1 => value1, 
#      formkey2 => value2, 
#      ...
#    ],
#    headerkey1 => value1, 
#    headerkey2 => value2, 
# 		       );
		       
