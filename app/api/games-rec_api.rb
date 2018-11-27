require 'games-rec_api/ver1/api'
require 'games-rec_api/exceptions'
require 'games-rec_api/entities'

module GamesRecApi
  module Authenticators
    autoload :Simple, 'games-rec_api/authenticators/simple'
  end

  module Authorizators
    autoload :Simple, 'games-rec_api/authorizators/simple'
  end

  mattr_accessor :authenticator
  @@authenticator = GamesRecApi::Authenticators::Simple

  mattr_accessor :authorizator
  @@authorizator = GamesRecApi::Authorizators::Simple

  class API < Grape::API
    mount GamesRecApi::Ver1::API

  end
end
