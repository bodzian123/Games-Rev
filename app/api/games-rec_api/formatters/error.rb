module GamesRecApi
  module Formatters
    module Error
      class << self
        def call(error, backtrace, options, env, status = nil)
          @error = error
          # @message = Grape::ErrorFormatter::Base.present(@error.message, env)

          result = @message.is_a?(Hash) ? @message : {
            errors: {
              status: status,
              title: title,
              detail: message
            }
          }

          merge_details(result, backtrace, options)

          #Rollbar.error(error) if status == 404 || status >= 500
          MultiJson.dump(result)
        end

        def merge_details(result, backtrace, options)
          if (options[:rescue_options] || {})[:backtrace] && backtrace && !backtrace.empty?
            result = result[:errors].merge(detail: backtrace)
          end
          result
        end

        def message
          if @error.class == ActiveRecord::RecordNotFound
            "Couldn't find requested resource."
          else
            @message
          end
        end

        def title
          if @error.respond_to?(:as_json) && @error.as_json.is_a?(Hash) && @error.as_json[:title]
            return @error.as_json[:title]
          end

          case @error
          when Grape::Exceptions::ValidationErrors, ActiveRecord::RecordInvalid
            'Validation failed'
          when ActiveRecord::RecordNotFound
            'Record not found'
          else
            'Server error'
          end
        end
      end
    end
  end
end
