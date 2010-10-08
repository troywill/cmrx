#!/usr/bin/env perl
use warnings;
use strict;
use LWP::UserAgent;
use JSON;

my $host = 'http://stylerx.ath.cx';
$host = 'http://troywill.com:3000';
my $iphone_api_key = '3ed1d41ec357a2874e5b891846c84605c93812ad';
my $flash_api_key = '4356e1973d1cf09a450d2704afc35d0e5be2304e';
my $url = "${host}/users/2.json?api_key=${flash_api_key}";

my $user = {
    first_name => 'Troy', 
    last_name => 'Will',
    email => 'troydwill@gmail.com'
};

my %HoH = (
    user => $user
    );

# my $user = \(
#     user =>  {
# 	first_name => 'Troy', 
# 	last_name => 'Will',
# 	email => 'troydwill@gmail.com'
#     }
#     );

# my $user = &get_user;
# print ${$user}{'user'}{'email'}, "\n";
&show_user_schema;
&get_user;
&create_user;

sub create_user {
    use String::Random qw(random_regex random_string);
# print random_regex('\d\d\d'); # Also prints 3 random digits
# print random_string("...");   # Also prints 3 random printable characters
    my $random_email = 'jane_' . random_regex('\d\d\d') . '@clear-media.com';
    print $random_email;
    my $ua = LWP::UserAgent->new();
    my $json_text = '{"user":{"last_name":"Last","first_name":"First","email":"' . $random_email . '"}}';
    my $response = $ua->post ( "$host/users.json?api_key=$flash_api_key", Content => $json_text, 'Content-Type' => 'application/json' );
}    

sub get_user {
    print "In sub get_user ...\n";
    my $ua = LWP::UserAgent->new();
    my $body = $ua->get($url);
    print $body->decoded_content;
    # print "==> ${$body}{_msg}\n";
    # print "==> ${$body}{_content}\n";
    my $perl_scalar = from_json($body->decoded_content);
    # print "Keys: ", keys %{$perl_scalar}, "\n";
    # print ${$perl_scalar}{'email'}{'first_name'}, "\n";
    return $perl_scalar;
}

sub show_user_schema {

  
#  my $user = $HoH{'user'};
  print "$user->{'email'}\n";
  
  print "Dumping current user data:\n";
  # print the whole thing
  # foreach my $family ( keys %HoH ) {
  #   print "$family: { ";
  #   for my $role ( keys %{ $HoH{$family} } ) {
  #     print "$role=$HoH{$family}{$role} ";
  #   }
  #   print "}\n";
  # }

  my $user_schema =  <<HERE;
  create_table "users", :force => true do |t|
    t.string   "first_name",                :limit => 100, :default => ""
    t.string   "last_name",                 :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "api_key",                   :limit => 40,  :default => ""
    t.string   "security_key",              :limit => 40,  :default => ""
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end
HERE

}
__END__

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
		       
__END__
# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 3) do

  create_table "prescriptions", :force => true do |t|
    t.integer  "user_id",            :null => false
    t.integer  "created_by_id"
    t.datetime "request_datetime"
    t.datetime "available_datetime"
    t.integer  "height_inches"
    t.integer  "bust_inches"
    t.integer  "waist_inches"
    t.integer  "hip_inches"
    t.boolean  "red_spots"
    t.boolean  "dark_circles"
    t.boolean  "wrinkles"
    t.boolean  "freckles"
    t.boolean  "loves_skin"
    t.boolean  "other_skin_issues"
    t.integer  "comfort_in_heels"
    t.integer  "skin_tone"
    t.integer  "hair_color"
    t.string   "product_id"
    t.string   "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name",              :limit => 40
    t.string   "authorizable_type", :limit => 40
    t.integer  "authorizable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",                :limit => 100, :default => ""
    t.string   "last_name",                 :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "api_key",                   :limit => 40,  :default => ""
    t.string   "security_key",              :limit => 40,  :default => ""
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
    
