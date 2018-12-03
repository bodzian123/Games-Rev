module GamesRecApi
  module Ver1
    class Movies::Comentages < Grape::API
      include Grape::Kaminari
      namespace :movies do
        resource :comentages do


        end
      end
    end
  end
end
