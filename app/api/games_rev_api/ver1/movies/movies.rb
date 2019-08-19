module GamesRevApi
  module Ver1
    class Movies::Movies < Grape::API
      include Grape::Kaminari
      namespace :movies do
        resource :movies do



        end
      end
    end
  end
end
