# frozen_string_literal: true

module Api
  class Search < Base
    def initialize(params)
      @query_string = params[:query]
    end

    def call
      url = "#{::Api::Base::URL}/2.3/search/advanced"
      params = {
        site: 'stackoverflow',
        title: @query_string,
        accepted: true,
        pagesize: 50
      }

      make_request(url, params)
    end
  end
end
