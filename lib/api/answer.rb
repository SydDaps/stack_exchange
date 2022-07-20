# frozen_string_literal: true

module Api
  class Answer < Base
    def initialize(params)
      @ids = params[:ids]
    end

    def call
      url = "#{Api::Base::URL}/2.3/answers/#{@ids}"
      params = {
        site: 'stackoverflow',
        filter: 'withbody'
      }

      make_request(url, params)
    end
  end
end
