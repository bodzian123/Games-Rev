require 'grape-kaminari'

module GamesRevApi
  module Ver1
    class Passwords < Grape::API
      resource :passwords do


        desc 'Create request for new password'
        params do
          requires :email, type: String, desc: 'User email to remind password'
        end
        post '/request_remind' do

          reminder = PasswordReminder.new(User.find_by_email(permitted_params[:email]))
          reminder.send_reset_password_email

          status 200
        end

        desc 'Reset password if token is valid'
        params do
          requires :reset_password_token, type: String, desc: 'Hash with password confirmation'
          requires :passwords, type: Hash do
            requires :new_password, type: String
            requires :new_password_confirmation, type: String
          end
        end
        post '/reset_password' do

            reminder = PasswordReminder.new(User.find_by_reset_password_token(permitted_params[:reset_password_token]))
            reminder.reset_password(permitted_params[:passwords])

            status 200
        end

      end
    end
  end
end
