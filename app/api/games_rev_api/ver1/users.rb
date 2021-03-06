module GamesRevApi
  module Ver1
    class Users < Grape::API
      include Grape::Kaminari
      resource :users do

        desc 'Return all users'
        get '' do
          authenticate!
          authorize! :read, User

          user = User.all

          present user, with: GamesRevApi::Entities::User
        end

        desc 'Return a user'
        params do
          requires :id, type: String, desc: 'ID of the user'
        end
        get ':id' do
          authenticate!
          authorize! :read, User

          user = User.find_by_id(params[:id])
          present user, with: GamesRevApi::Entities::User
        end

        desc 'Login'
       params do
         requires :email, type: String, desc: 'Email'
         requires :password, type: String, desc: 'Password'
       end
       post '/login' do
         user = User.authenticate(permitted_params)
         unless user
           fail GamesRevApi::Exceptions::Unauthorized, message: 'Authentication failed'
         end
         present user, with: GamesRevApi::Entities::User
       end

      end
    end
  end
end
 
