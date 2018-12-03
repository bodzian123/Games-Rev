module GamesRecApi
  module Entities
    class Game < Grape::Entity
      expose :title
      expose :text
      expose :id
      expose :created_at
      expose :updated_at
    end
  end
end
