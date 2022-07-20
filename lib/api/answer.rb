# frozen_string_literal: true

module Api
  class Answer < Base
    def initialize(params)
      @ids = params[:id]
    end

    def call
      url = "#{Api::Base::URL}/2.3/answers/"
      params = {
        site: 'stackoverflow',
        ids: @ids,
        filter: 'withbody'
      }

      make_request(url, params)
    end
  end
end
