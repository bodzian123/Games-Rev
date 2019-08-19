module GamesRevApi
  module Entities
    class User < Grape::Entity
      expose :email
      expose :created_at
      expose :id
    end
  end
end
