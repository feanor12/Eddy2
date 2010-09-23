authorization do
  role :admin do
    has_permission_on :posts, :to=>[:manage]
    has_permission_on :comments, :to=>[:manage]
    has_permission_on :users, :to=>[:manage]
    has_permission_on :lectures, :to=>[:manage]
    has_permission_on :downloads, :to=>[:manage]
    has_permission_on :mylinks, :to=>[:manage]
    has_permission_on :announcements, :to=>[:manage]
  end

  role :user do
    has_permission_on :users, :to=>[:update] do
      if_attribute :id => is {user.id}
    end

    has_permission_on :posts, :to=>[:create,:read]
    has_permission_on :posts, :to=>[:update,:destroy] do
      if_attribute :user => is { user }
    end

    has_permission_on :lectures, :to=>[:read,:create]
    has_permission_on :lectures, :to=>[:update,:destroy] do
      if_attribute :user => is { user }
    end


    has_permission_on :mylinks, :to=>[:create] 
    has_permission_on :mylinks, :to=>[:update,:read,:destroy] do
      if_attribute :user => is {user}
    end

    has_permission_on :downloads, :to=>[:read,:create]
    #has_permission_on :downloads, :to=>[:update,:destroy] do
    #  if_attribute :user => is {user}
    #end

    has_permission_on :comments, :to=>[:create,:read] 
    has_permission_on :comments, :to=>[:manage] do
      if_attribute :user => is { user }
    end
  end
  role :guest do
    has_permission_on :users, :to=>[:new,:create]
    has_permission_on :posts, :to=>[:read]
    has_permission_on :lectures, :to=>[:read]
    has_permission_on :announcements, :to=>[:read]
  end
end

privileges do
  privilege :manage, :includes => [:create,:read,:update,:destroy]
  privilege :read, :includes => [:index,:show]
  privilege :create, :includes => [:new]
  privilege :update, :includes => [:edit,:update]
end


