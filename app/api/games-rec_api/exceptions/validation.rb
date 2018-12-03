require 'grape/exceptions/base'

module GamesRecApi
  module Exceptions
    class Validation < Grape::Exceptions::Base
      STATUS = 400
      include Enumerable
      attr_reader :errors

      def initialize(args = {})
        @errors = args[:errors]
        super message: @errors.full_messages.join(', '), status: STATUS
      end

      def each
        errors.each_pair do |attribute, errors|
          errors.each do |error|
            yield attribute, error
          end
        end
      end

      def as_json
        {
          status: STATUS,
          title: @errors.full_messages.join(', '),
        }
      end

      def to_json
        as_json.to_json
      end
    end
  end
end
