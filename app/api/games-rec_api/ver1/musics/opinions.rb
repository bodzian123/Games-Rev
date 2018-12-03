module GamesRecApi
  module Ver1
    class Musics::Opinions < Grape::API
      include Grape::Kaminari
      namespace :musics do
        resource :opinions do



        end
      end
    end
  end
end
