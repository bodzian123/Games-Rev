module GamesRevApi
  module Entities
    class Movie < Grape::Entity
      expose :title
      expose :text
      expose :id
      expose :created_at
      expose :updated_at
    end
  end
end
