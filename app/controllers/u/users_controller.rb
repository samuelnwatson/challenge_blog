class U::UsersController < ApplicationController
	def index
		@user = current_user
		subscribe		
	end

private

	def user_params
		params.require(:user).permit(:subscribed)
	end

	def subscribe
		 if @user.subscribed
		 	@user.subscribed = false
			
			if @user.save
				flash.now[:alert] = "You have unsubscribed."
				render "index"
			else
				flash.now[:alert] = "You have not been unsubscribed."
				render "index"
			end
		 else 
		 	@user.subscribed = true
			
			if @user.save
				flash.now[:notice] = "You have subscribed."
				render "index"
			else
				flash.now[:alert] = "You have not subscribed."
				render "index"
			end		 	
		 end
	end

end