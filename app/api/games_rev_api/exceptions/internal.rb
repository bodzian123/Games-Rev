require 'grape/exceptions/base'

module GamesRevApi
  module Exceptions
    class Internal < Grape::Exceptions::Base
      STATUS = 500
      include Enumerable

      def initialize(options = {})
        @status = options[:status] || STATUS
        super message: options[:message], status: @status
      end

      def as_json(_opts = {})
        {
            title: 'Internal server error',
            status: @status
        }
      end
    end
  end
end
