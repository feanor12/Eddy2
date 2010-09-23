# coding: utf-8
#Roles
    admin_role=Role.create(:name=>'admin')
    user_role=Role.create(:name=>'user')
#User
    admin=User.create(:email=>"admin@student.tugraz.at", :password=>'123456',:password_confirmation=>'123456',:login=>"admin")
    admin.role=admin_role
    admin.activate!
#News
    Post.create(:title=>"Welcome",:body=>"Log In with\n <b>Login:</b>"+admin.email+"\n<b>Password:</b>123456\n\n Please change this password and have fun.",:user=>admin)
#Lectures
require "open-uri"
require "openssl"

base_url = "https://online.tugraz.at/tug_online/" 
sem_physik = "https://online.tugraz.at/tug_online/semesterplaene.uebersicht?corg_nr=202&csr_nr=132&pStpStpNr=524&csj_nr=1031&csprache_nr=1"
sem_math = "https://online.tugraz.at/tug_online/semesterplaene.uebersicht?corg_nr=202&csr_nr=137&pStpStpNr=522&csj_nr=1031&csprache_nr=1"
sem_url = sem_physik #load physick lectures
l_url = "http://online.tugraz.at/tug_online/lv.detail?sprache=1&clvnr=%s"
# Semesterübersicht

sem = open(sem_url).read
r_sem = /href="(.*)" TARGET="SEM_PLAN"/
r_l = /HREF="javascript:detwin\(( [0-9]*)\);"/
r_titel = /<span class="bold">(.*)<\/span>/
r_desc= /<TH [ALIGN="RIGHT"|class="maskRT"|\s]{2,}>Inhalt<\/TH>[\n\r\s]*<td[class="maskLT"|align="LEFT"|\s]{2,}>(.*)<\/td>\n<\/TR>\n<TR VALIGN=\"TOP\" class=\"mask\">\n<TH ALIGN=\"RIGHT\" class=\"maskRT\">Inhaltliche Voraussetzungen/mi

m = sem.scan(r_sem)

l_names=[]
m.each do |s|
	l=open(base_url+s[0].to_s)
	lm=l.read.scan(r_l)
	lm.each do |id|
		begin
			ls= open(l_url%id.flatten.first.strip )
			ltext=ls.read
			lt=ltext.scan(r_titel)
			ld=ltext.scan(r_desc)
		rescue
			puts "failed %s"%id.flatten.first.strip
		else
			t = case lt[2][0]
				when "Übung" then "UE"
				when "Vorlesung" then "VO"
				when "Vorlesung-Übung" then "VU"
        when "Laborübung" then "LU"
        when "Praktikum" then "PR"
				else ""
				end
			l_names+=[[lt[0],ld[0],t]]
		end
	end
end

l_names.each do |x,y,z|
	y[0].gsub!(/<br>/,"\n")
	y[0].gsub!(/\r/,"")
	y[0].strip!
	Lecture.create(:name=>z+" "+x[0],:description=>y[0])
end
