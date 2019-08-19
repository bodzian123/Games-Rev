require 'grape/exceptions/base'

module GamesRevApi
  module Exceptions
    class Unauthorized < Grape::Exceptions::Base
      STATUS = 401
      include Enumerable

      def initialize(options = {})
        @status = options[:status] || STATUS
        super message: options[:message], status: @status
      end

      def as_json(_opts = {})
        {
          title: 'Unauthorized',
          status: @status
        }
      end
    end
  end
end
