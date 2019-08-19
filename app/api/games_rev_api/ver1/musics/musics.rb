module GamesRevApi
  module Ver1
    class Musics::Musics < Grape::API
      include Grape::Kaminari
      namespace :musics do
        resource :musics do



        end
      end
    end
  end
end
