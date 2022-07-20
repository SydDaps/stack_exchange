class SearchController < ApplicationController
  def index

  end

  def process_query
    @results = query_param[:query]
    render :index
  end

  private
  def query_param
    params.permit(:query)
  end
end
