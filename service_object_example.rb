# app/services/application_service.rb
class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end
end

# API client to call Shopify
module Shopify
  module Api
    class Client < ApplicationService
      def initialize(endpoint)
        @endpoint = endpoint
      end

      def api_url
        "https://#{@endpoint.url_path}.myshopify.com/admin"
      end

      def connect()
        # logic to call shopify API
      end

      def call
        begin
          connection = connect
        rescue Exception => ex
          Rails.logger.error "APIs Connection failed: #{ex.message}"
          Rails.logger.error "Backtrace:\n\t#{ex.backtrace.join("\n\t")}"
        end
      end

    end
  end
end


# notes:
# Only One Public Method per Service Object
# Service objects are single business actions
# Handle Exceptions inside the Service Object