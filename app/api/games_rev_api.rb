require 'games_rev_api/ver1/api'
require 'games_rev_api/exceptions'
require 'games_rev_api/entities'

module GamesRevApi
  module Authenticators
    autoload :Simple, 'games_rev_api/authenticators/simple'
  end

  module Authorizators
    autoload :Simple, 'games_rev_api/authorizators/simple'
  end

  mattr_accessor :authenticator
  @@authenticator = GamesRevApi::Authenticators::Simple

  mattr_accessor :authorizator
  @@authorizator = GamesRevApi::Authorizators::Simple

  class API < Grape::API
    mount GamesRevApi::Ver1::API

  end
end
