module GamesRevApi
  module Entities
    class Game < Grape::Entity
      expose :title
      expose :text
    end
  end
end
