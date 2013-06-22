class RegistrationsController < Devise::RegistrationsController
	def update		
		check_and_update_registration

		if resource.update_with_password(params[resource_name])
			check_and_update_registration
			puts "*********** resource updated with password"
    		set_flash_message :notice, :updated
    		sign_in resource_name, resource, :bypass => true
    		redirect_to after_update_path_for(resource)
  		else
    		puts "*********** resource updated with password was false"
    		clean_up_passwords(resource)
    		render "edit"
    	end

    	puts "*********** user:"
		puts @user
		puts "*********** resource:"
		puts resource
		puts "*********** params:"
		puts params
		puts resource.not_registered		
	end


	def new
		super
	end 

	def create
		super
	end 

	def edit
		super
	end 

	def cancel
		super
	end 

	def destroy
		super
	end 

	private
		def check_and_update_registration
			if resource.not_registered == 1 && !resource.encrypted_password.blank?
        		resource.update_attribute(:not_registered, "0")
      		end
      	end
      		
end
