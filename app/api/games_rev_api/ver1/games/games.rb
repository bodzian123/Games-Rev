module GamesRevApi
  module Ver1
    class Games::Games < Grape::API
      include Grape::Kaminari
      namespace :games do
        resource :games do

          desc 'Return all games'
          get '/games' do
            authorize! :read, User
            games = Game.all

            present games, with: GamesRevApi::Entities::Game
          end


        end
      end
    end
  end
end
