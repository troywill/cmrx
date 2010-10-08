#!/usr/bin/env perl
print `date`;
use warnings;
use strict;
use JSON;

my $admin_email = 'michael.john.kirk@gmail.com';
my $admin_password = 'password';
my $rails_host = 'http://troywill.com:3000';

my %admin_internal_state = (
		      admin_email => $admin_email,
		      admin_password => $admin_password,
		      cookie => "",
		      rails_host => $rails_host
		     );


while ( 1 ) {
  &menu;
  chomp( my $input = <STDIN> );
  last if ( $input eq 'q' or $input eq 'Q' );
}

&display_admin_internal_state ( \%admin_internal_state );

sub display_admin_internal_state {
  print "+---- display_admin_internal_state --------------+\n";
  my $href = shift;
  for my $key (keys %{$href}) {
    print "| $key => ${$href}{$key}\n";
  }
  print "+------------------------------------------------+\n";
}


sub menu {
    print "\n\n+-------------- Prescription RX Client Emulator  --------------+\n";
    print "|\tQ to quit\n";
  print "| 1. Show current User hash in JSON\n";
  print "| 2. Edit User data\n";
  print "| 3. Register a new User (POST JSON User hash to $server/users)\n";
  print "| 4. Retrieve prescription .zip file\n";
  print "| 5. Display registered users\n";
  print "| Choice? ";
}



exit;
my $server = 'http://troywill.com:3000';

# Randomly generate data that user will need to input
my ( $first_name, $last_name, $email )  = &get_name_and_email;

sub get_name_and_email {
    my @first_names = qw( Mary Patricia Linda Barbara Elizabeth Jennifer Maria Susan Margaret Dorothy );
    my @last_names = qw( Smith Johnson Williams Brown Jones Miller Davis García Rodríguez Wilson );
    my $range = 10;
    my $random_number = int(rand($range));
    my $first_name = $first_names[$random_number];
    my $last_name = $last_names[int(rand($range))];
    use String::Random qw(random_regex random_string);
    my $email = lc($first_name);
    $email = $email . random_regex('\d\d\d\d') . '@gmail.com';
    print "==> $random_number, $first_name, $last_name, $email\n";
    return ( $first_name, $last_name, $email );
}

exit;
my $api_key = &get_api_key;
sub get_api_key {};
my $security_key = &get_security_key;
sub get_security_key {};
my $password = &get_password;
sub get_password {};

my $bust = &get_bust;
my $waist = &get_waist;
my $hips = &get_hips;

my %user = (
	      user => {
		  email => $email,
    }
    );


sub get_bust {
    return 36
}

sub get_waist {
    return 24
}

sub get_hips {
    return 36
}

exit;
__END__
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
    print "\n+---------------------------------------------------------------\n";
    print "| Registered Users, viewable at $server/users\n";
    print "| or $server/users.json\n";
    print "| or $server/users.xml\n";
    print "|\n";
      my $curl_get_command = "curl --header 'Content-Type:application/json' --header 'Accept:application/json' --request GET $server/users 2>/dev/null";
      # print "\n==> $curl_get_command\n";
      my $server_response= `$curl_get_command`;
      # print "\n>>> Server JSON response <<<\n";
      # print $server_response;
      my $perl_arrayref  = decode_json $server_response;
      # print "==> $perl_arrayref <==\n";
      for my $href ( @{$perl_arrayref} ) {
	  print "| id: $href->{'user'}->{'id'}, $href->{'user'}->{'register_email'}, registered at $href->{'user'}->{'created_at'}\n";
      }
    print "+--------------------------------------------------------------\n";
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

__END__
#!/usr/bin/env perl
use warnings;
use strict;
use LWP::UserAgent;
use JSON;

my $host = 'http://stylerx.ath.cx';
my $iphone_api_key = '784da8554937a966ec97aec8ed1ec659e25e334b';
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
    
