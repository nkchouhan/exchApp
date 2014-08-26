module ApplicationHelper
   def user_type(user)
		 if((user.has_role? :admin) && (user.has_role? :user))
			 return "Client & Admin"
		 elsif(user.has_role? :admin)
			 return  "Admin"
		 elsif(user.has_role? :user)
			return "Client"
		 end
  end
end
