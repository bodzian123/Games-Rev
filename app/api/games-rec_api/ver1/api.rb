require 'grape'
require 'grape-swagger'

require 'games-rec_api/formatters/error'
require 'games-rec_api/ver1/users'

# endpoints common
require 'games-rec_api/ver1/passwords'


# endpoints for games
require 'games-rec_api/ver1/games/games'
require 'games-rec_api/ver1/games/comments'

# endpoints for movies
require 'games-rec_api/ver1/movies/movies'
require 'games-rec_api/ver1/movies/comentages'

# endpoints for musics
require 'games-rec_api/ver1/musics/musics'
require 'games-rec_api/ver1/musics/opinions'


module GamesRecApi
  module Ver1
    class API < Grape::API
      default_format :json
      format :json

      before do
        if Rails.env.development?
          header 'Access-Control-Allow-Headers', 'X-Token, Content-Type, Cache-Control, X-Requested-With'
          header 'Access-Control-Allow-Origin', '*'
          header 'Access-Control-Allow-Methods', 'POST, GET, OPTIONS, PATCH, PUT'
          header 'Access-Control-Max-Age', '1728000'
          header 'Access-Control-Allow-Credentials', 'true'
          puts params.inspect
        end


      end

      # Handle all exceptions with an error response appropriate to the requested
      # output format
      rescue_from :all do |e|
        # Get the output format requested by the user
        format = env['api.format']
        puts ""
        puts e
        puts e.backtrace[0..10]
        puts ""
        # Set the HTTP status appropriately for the requested output format and
        # the error type
        status = case e.class.name
                   when 'ActiveRecord::RecordNotFound'
                     404
                   when 'ActiveRecord::RecordInvalid'
                     400
                 end

        status ||= (e.respond_to? :status) && e.status || 500

        # Set the HTTP headers appropriately for the requested format
        headers = { 'Content-Type' => options[:content_types][format] || 'text/plain' }

        # Format the message body using the appropriate error formatter
        error_formatter = GamesRecApi::Formatters::Error
        body = error_formatter.call(e, nil, options, env, status)

        # Return the error response to the client in the correct format
        # with the correct HTTP headers for that format
        Rack::Response.new(body, status, headers).finish
      end

      helpers do
        include GamesRecApi::Ver1::Helpers
      end

      # endpoints common
      mount GamesRecApi::Ver1::Users
      mount GamesRecApi::Ver1::Passwords


      # endpoints for games
      mount GamesRecApi::Ver1::Games::Games
      mount GamesRecApi::Ver1::Games::Comments

      # endpoints for movies
      mount GamesRecApi::Ver1::Movies::Movies
      mount GamesRecApi::Ver1::Movies::Comentages

      # endpoints musics
      mount GamesRecApi::Ver1::Musics::Musics
      mount GamesRecApi::Ver1::Musics::Opinions

      add_swagger_documentation api_version: 'v1',
                                hide_documentation_path: true
    end
  end
end
