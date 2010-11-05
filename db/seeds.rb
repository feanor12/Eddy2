# coding: utf-8
#Roles
    admin_role=Role.create(:name=>'admin')
    mod_role=Role.create(:name=>'mod')
    user_role=Role.create(:name=>'user')
#User
    admin=User.create(:email=>"admin@student.tugraz.at", :password=>'123456',:password_confirmation=>'123456',:login=>"admin")
    admin.role=admin_role
    admin.activate!
#News
    Post.create(:title=>"Welcome",:body=>"Log In with\n <b>Login:</b>"+admin.email+"\n<b>Password:</b>123456\n\n Please change this password and have fun.",:user=>admin)
#Lectures
Lecture.create(:name=>"TestLecture 1",:description=>"SOme Description")
Lecture.create(:name=>"TestLecture 2",:description=>"SOme Description")
