authorization do

#################################################################
## ADMIN
#################################################################
  role :admin do
    has_permission_on :posts, :to=>[:manage]
    has_permission_on :comments, :to=>[:manage]
    has_permission_on :users, :to=>[:manage,:promote,:index_mods]
    has_permission_on :lectures, :to=>[:manage,:parse]
    has_permission_on :downloads, :to=>[:manage,:download]
    has_permission_on :mylinks, :to=>[:manage]
    has_permission_on :announcements, :to=>[:manage]
    has_permission_on :statics, :to=>[:manage,:up,:down]
    has_permission_on :links, :to=>[:manage]
    has_permission_on :static_links, :to=>[:manage,:up,:down]
    has_permission_on :group_applications,:to=>[:manage]
    has_permission_on :groups,:to=>[:manage]
    has_permission_on :user_sessions,:to=>[:destroy]
    has_permission_on :timers,:to=>[:manage]
  end

#################################################################
## MOD
#################################################################
  role :mod do
    has_permission_on :posts, :to=>[:read,:create]
    has_permission_on :posts, :to=>[:update,:destroy] do
      if_attribute :user => is { user }
    end

    has_permission_on :comments, :to=>[:manage]
    has_permission_on :lectures, :to=>[:manage]
    has_permission_on :downloads, :to=>[:manage,:download]

    has_permission_on :mylinks, :to=>[:create]
    has_permission_on :mylinks, :to=>[:update,:read,:destroy] do
      if_attribute :user => is {user}
    end

    has_permission_on :announcements, :to=>[:manage]
    has_permission_on :links, :to=>[:manage]
    has_permission_on :users, :to=>[:index_mods]
    has_permission_on :users, :to=>[:update] do
      if_attribute :id => is {user.id}
    end
    has_permission_on :static_links, :to=>[:show]
    has_permission_on :statics, :to=>[:show]
    has_permission_on :user_sessions,:to=>[:destroy]
  end

#################################################################
## USER
#################################################################
  role :user do
    has_permission_on :users, :to=>[:index_mods]
    has_permission_on :users, :to=>[:update] do
      if_attribute :id => is {user.id}
    end

    has_permission_on :announcements, :to=>[:read,:create]
    has_permission_on :announcements, :to=>[:update,:destroy] do
      if_attribute :user => is {user}
    end

    has_permission_on :posts, :to=>[:read]

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
    has_permission_on :static_links, :to=>[:show]
    has_permission_on :statics, :to=>[:show]
    has_permission_on :user_sessions,:to=>[:destroy]
  end

#################################################################
## GUEST
#################################################################
  role :guest do
    has_permission_on :announcements, :to=>[:read]
    has_permission_on :comments, :to=>[:read]
    has_permission_on :downloads, :to=>[:read] 
    has_permission_on :downloads, :to=>[:download] do
      if_attribute :public => is {true}
    end
    has_permission_on :lectures, :to=>[:read]
    has_permission_on :links,:to=>[:read]
    #has_permission_on :mylinks, :to=>[:read]
    has_permission_on :posts, :to=>[:read]
    has_permission_on :statics, :to=>[:show]
    has_permission_on :users, :to=>[:new,:create]
    has_permission_on :static_links, :to=>[:show]
    has_permission_on :activations,:to=>[:create]
    has_permission_on :password_resets,:to=>[:create,:new,:update]
    has_permission_on :user_sessions,:to=>[:create,:new]
  end
end

privileges do
  privilege :manage, :includes => [:create,:read,:update,:destroy]
  privilege :read, :includes => [:index,:show]
  privilege :create, :includes => [:new]
  privilege :update, :includes => [:edit,:update]
end

