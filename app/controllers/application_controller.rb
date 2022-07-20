# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def answer(question)
    @accepted_answers.select { |a| a['answer_id'] == question['accepted_answer_id'] }
  end
  helper_method :answer
end
