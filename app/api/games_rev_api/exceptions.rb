module GamesRevApi
  module Exceptions
    extend ActiveSupport::Autoload
    autoload :Unauthorized
    autoload :Validation
    autoload :InvalidRequest
    autoload :Internal
  end
end
