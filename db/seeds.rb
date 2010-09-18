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
require "open-uri"
require "openssl"

base_url = "https://online.tugraz.at/tug_online/" 
sem_physik = "https://online.tugraz.at/tug_online/semesterplaene.uebersicht?corg_nr=202&csr_nr=132&pStpStpNr=524&csj_nr=1031&csprache_nr=1"
sem_url = sem_physik
l_url = "http://online.tugraz.at/tug_online/lv.detail?sprache=1&clvnr=%s"

r_sem = /href="(.*)" TARGET="SEM_PLAN"/
r_l = /HREF="javascript:detwin\(( [0-9]*)\);"/
r_titel = /<span class="bold">(.*)<\/span>/

sem = open(sem_url).read
m = sem.scan(r_sem)
l_names=[]
m.each do |s|
	l=open(base_url+s[0].to_s)
	lm=l.read.scan(r_l)
	lm.each do |id|
		begin
			ls= open(l_url%id.flatten.first.strip )
			lt=ls.read.scan(r_titel)
		rescue
			puts "failed to seed Lecture with id %s"%id.flatten.first.strip
		else
			l_names+=lt[0]
		end
	end
end

l_names.uniq.each do |l|
	puts l
  Lecture.create(:name=>l) 
end
