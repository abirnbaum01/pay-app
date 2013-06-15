class UserMailersController < ApplicationController

	before_filter :authenticate_user!

	def show
		@user = current_user
	end

	def edit
		@user = User.find(params[:id])
	end

	def update

		@user = User.find(params[:id])

	    respond_to do |format|
	      if @user.update_attributes(params[:user])
	        format.html { redirect_to payments_url, :flash => { :success => "Email options were successfully updated." } }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
	end
end
