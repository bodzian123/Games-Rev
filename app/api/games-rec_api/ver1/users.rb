module GamesRecApi
  module Ver1
    class Users < Grape::API
      include Grape::Kaminari
      resource :users do

        desc 'Return all users'
        get '/users' do
          authenticate!
          authorize! :read, User

          present User.all, with: GamesRecApi::Entities::User
        end

      end
    end
  end
end
