authorization do

#################################################################
## ADMIN
#################################################################
  role :admin do
    has_permission_on :posts, :to=>[:manage]
    has_permission_on :comments, :to=>[:manage]
    has_permission_on :users, :to=>[:manage,:promote]
    has_permission_on :lectures, :to=>[:manage]
    has_permission_on :downloads, :to=>[:manage,:download]
    has_permission_on :mylinks, :to=>[:manage]
    has_permission_on :announcements, :to=>[:manage]
    has_permission_on :statics, :to=>[:manage]
    has_permission_on :links, :to=>[:manage]
  end

#################################################################
## MOD
#################################################################
  role :mod do 
    has_permission_on :posts, :to=>[:manage]
    has_permission_on :comments, :to=>[:manage]
    has_permission_on :lectures, :to=>[:manage]
    has_permission_on :downloads, :to=>[:manage,:download]
    has_permission_on :mylinks, :to=>[:manage] do
      if_attribute :user => is {user}
    end
    has_permission_on :announcements, :to=>[:manage]
    has_permission_on :links, :to=>[:manage]
  end

#################################################################
## USER
#################################################################
  role :user do
    has_permission_on :users, :to=>[:update] do
      if_attribute :id => is {user.id}
    end

    has_permission_on :announcements, :to=>[:read]

    has_permission_on :posts, :to=>[:create,:read]
    has_permission_on :posts, :to=>[:update,:destroy] do
      if_attribute :user => is { user }
    end

    has_permission_on :lectures, :to=>[:read]

    has_permission_on :mylinks, :to=>[:create]
    has_permission_on :mylinks, :to=>[:update,:read,:destroy] do
      if_attribute :user => is {user}
    end

    has_permission_on :links, :to=>[:read,:create]
    has_permission_on :links, :to=>[:update,:destroy] do
      if_attribute :user => is {user}
    end


    has_permission_on :downloads, :to=>[:read,:create,:download]
    #has_permission_on :downloads, :to=>[:update,:destroy] do
    #  if_attribute :user => is {user}
    #end

    has_permission_on :comments, :to=>[:create,:read]
    has_permission_on :comments, :to=>[:manage] do
      if_attribute :user => is { user }
    end
  end

#################################################################
## GUEST
#################################################################
  role :guest do
    has_permission_on :announcements, :to=>[:read]
    has_permission_on :comments, :to=>[:read]
   # has_permission_on :downloads, :to=>[:read]
    has_permission_on :lectures, :to=>[:read]
    has_permission_on :links,:to=>[:read]
    #has_permission_on :mylinks, :to=>[:read]
    has_permission_on :posts, :to=>[:read]
    has_permission_on :statics, :to=>[:read]
    has_permission_on :users, :to=>[:new,:create]
  end
end

privileges do
  privilege :manage, :includes => [:create,:read,:update,:destroy]
  privilege :read, :includes => [:index,:show]
  privilege :create, :includes => [:new]
  privilege :update, :includes => [:edit,:update]
end

