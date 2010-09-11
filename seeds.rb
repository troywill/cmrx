# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

User.create( :register_email => 'wpackard@gmail.com', :password => 'passwd1', :first_name => 'Wayne', :last_name => 'Packard', :address => '315 E Franklin', :creation_date => '2010-09-06', :city => 'Los Angeles', :state => 'CA', :zipcode => '90245', :phone_number => '(415) 503-7331', :email => 'wpackard@gmail.com' )

User.create( :register_email => 'troydwill@gmail.com', :password => 'passwd1', :first_name => 'Troy', :last_name => 'Will', :address => '9844 Helena Ave', :creation_date => '2010-09-06', :city => 'Montclair', :state => 'CA', :zipcode => '12345', :phone_number => '(123) 456-7890', :email => 'troydwill@gmail.com' )

