#!/usr/bin/env perl
use warnings;
use strict;

my $url = 'http://192.168.1.5:3333/users/1.json';

use LWP::UserAgent;
use JSON;

# # Initialize the UserAgent object and send the request.
# # Notice that referer is set manually to a URL string.
my $ua = LWP::UserAgent->new();
# $ua->default_header("HTTP_REFERER" => 'localhost' );
# my $body = $ua->get($url);

# # process the json string
# my $perl_scalar = from_json($body->decoded_content);
# print `date`;
# print "Keys: ", keys %{$perl_scalar}, "\n";
# print ${$perl_scalar}{'user'}{'name'}, "\n";

my %hash_of_hash = ( user => { name => 'Tracy' } );
my $json_text = encode_json \%hash_of_hash;
print $json_text;

# my $response = $ua->(  my $curl_post_command = "curl --header 'Content-Type:application/json' --header 'Accept:application/json' --data '$json_text' $server/users 2>/dev/null";

print "HERE: ";
my $response = $ua->post ( 'http://192.168.1.5:3333/users', Content => $json_text, 'Content-Type' => 'application/json' );
$response = $ua->post ( 'http://192.168.1.5:3333/users', Content => $json_text, 'Content-Type' => 'application/json' );

my $count = 0;
for ( 1..1000 ) {
    $response = $ua->post ( 'http://192.168.1.5:3333/users', Content => $json_text, 'Content-Type' => 'application/json' );
    $count++;
    print "$count ";
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
		       
