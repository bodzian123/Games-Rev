module GamesRevApi
  module Authenticators
    class Simple
      def initialize(request, user = nil)
        @request = request
        @headers = @request.env['api.endpoint'].headers

        # @token = @headers['X-Token']

        @user = user
        @email = @user.email
        @password = @user.password
      end

      def current_user(_params = {})
        return @user unless @user.blank?
        @user ||= User.where(email: @email, password: @password).first
      end

      def authenticate?(_options = {})
        current_user.present?
      end

      # def current_superadmin(_params = {})
      #   return @user unless @user.blank?
      #   @user ||= Superadmin.where(authentication_token: @token).first
      # end

      # def authenticate_superadmin?(_options = {})
      #   current_superadmin.present?
      # end

      private

      def valid_token_length(token)
        token.present? && token.length >= 32
      end
    end
  end
end
