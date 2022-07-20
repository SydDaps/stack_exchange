# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'search', type: :request do
  describe 'GET /' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /search/{:query}' do
    it 'returns http success' do
      get '/search/', params: { query: 'test' }
      expect(response).to have_http_status(:success)
    end
  end
end
