module GamesRecApi
  module Entities
    class Opinion < Grape::Entity
      expose :id
      expose :commenter
      expose :body
      expose :game_id
      expose :created_at
      expose :updated_at
    end
  end
end
