module GamesRecApi
  module Ver1
    class Games::Games < Grape::API
      include Grape::Kaminari
      namespace :games do
        resource :games do

          desc 'Return all games'
          get '/games' do
            authenticate!
            authorize! :read, User
            games = Game.all

            present games, with: GamesRecApi::Entities::Game
          end


        end
      end
    end
  end
end
