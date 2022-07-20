# frozen_string_literal: true

module Api
  class Base
    URL = 'http://api.stackexchange.com'
    Response = Struct.new(:success?, :error_message)

    def self.call(context)
      new(context).call
    end

    def make_request(url, param)
      HTTParty.get(url, { query: param })
    rescue HTTParty::Error => e
      respond(e)
    rescue StandardError => e
      respond(e)
    end

    private

    def respond(error)
      Response.new false, error.message
    end
  end
end
