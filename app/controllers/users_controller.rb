class UsersController < ApplicationController
  before_action :authenticate_user!, except: :new

  private

    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation,
        :current_password,
        :date_of_birth,
        :profession,
        :gender,
        :vehicle,
        :available_for_work,
        :current_location,
        :description,
        :work_experience
      )
    end

    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation,:date_of_birth,:first_name,:last_name)
    end

end
