# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def create
        @user = User.new(user_params)
        if @user.save
          token = JsonWebToken.encode(user_id: @user.id, isAdmin: @user.isAdmin)
          time = Time.now + 24.hours.to_i
          render json: { token: token, exp: time.strftime('%m-%d-%Y %H:%M'),
                         username: @user.username }, status: :ok
        else
          render json: { errors: @user.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:firstName, :lastName,
                                     :email, :password, :password_confirmation, :address, :isAdmin)
      end
    end
  end
end