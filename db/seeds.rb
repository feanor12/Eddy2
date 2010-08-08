# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
    
#Roles
    admin_role=Role.create(:name=>'admin')
    user_role=Role.create(:name=>'user')
#User
    admin=User.create(:email=>"admin@student.tugraz.at", :password=>'123456',:password_confirmation=>'123456',:login=>"admin")
    admin.role=admin_role
    admin.activate!
#Lectures
    Lecture.create(:name=>'Vektoranaysis') 
    Lecture.create(:name=>'Experimentalphysik') 
    Lecture.create(:name=>'Analystische Mechanik') 
    Lecture.create(:name=>'Differentialgleichungen') 



