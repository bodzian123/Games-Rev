require 'grape/exceptions/base'

module GamesRevApi
  module Exceptions
    class InvalidRequest < Grape::Exceptions::Base
      STATUS = 400

      def initialize(args = {})
        super args.merge(status: STATUS)
      end

      def as_json
        {
            status: STATUS,
            title: 'Invalid request'
        }
      end

      def to_json
        as_json.to_json
      end
    end
  end
end
