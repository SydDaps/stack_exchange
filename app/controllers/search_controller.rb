# frozen_string_literal: true

class SearchController < ApplicationController
  def index; end

  def process_query
    @query = query_param[:query]
    related_questions(query_param)
    accepted_answers if @related_questions && @accepted_answer_ids

    render :index
  end

  def error
    flash[:error] = "route not found"
    redirect_to root_path
  end

  private

  def query_param
    params.permit(:query)
  end

  def related_questions(param)
    response = Api::Search.call(param)

    if response.success?
      response = response.parsed_response
      @related_questions = response['items']
      @accepted_answer_ids = @related_questions.pluck('accepted_answer_id')
    else
      return_error(response)
    end
  end

  def accepted_answers
    response = Api::Answer.call({ ids: @accepted_answer_ids.join("\;") })

    if response.success?
      response = response.parsed_response
      @accepted_answers = response['items']
    else
      return_error(response)
    end
  end

  def return_error(response)
    flash[:error] = response[:error_message] || response.parsed_response['error_message']
  end
end
