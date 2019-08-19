module GamesRevApi
  module Authorizators
    class Simple

      def initialize(user = nil)
        @user = user
      end

      def authorize?(action, subject,namespace)

        unless namespace.empty?
        end

        Ability.new(@user).can?(action, subject)
      end

    end
  end
end
