class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
       @user = User.new(user_params)
        if @user.save
            redirect_to new_user_path, notice: "User saved!"

        else 
            # render :new,  notice: "Failed to save user"
            redirect_to new_user_path, notice: "Failed to save User"
            
        end 
    end

    #Important when doing edit 
    #https://learn.co/lessons/rails-edit-update-action-readme


    def edit
        @user = User.find(params[:id]) # change this to the ID symbol
    end

    def update
        @user = User.find(params[:id])
        
        if @user.update(user_params)
            redirect_to new_user_path, notice: "User Updated!"
        else
            render :edit, notice: "failer to update User!"
        end
    end

    private
    def user_params
        #the order appears to be important here it, reflects the order of the schema
        params.require(:user).permit(:username,:email,:password)
    end
end


