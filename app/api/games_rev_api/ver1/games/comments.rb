module GamesRevApi
  module Ver1
    class Games::Comments < Grape::API
      include Grape::Kaminari
      namespace :games do
        resource :comments do



        end
      end
    end
  end
end
