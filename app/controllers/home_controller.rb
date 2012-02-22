class HomeController < ApplicationController
  before_filter :setup

  def index
  end

  def results
    if @answer.valid?
      @personality_type = @answer.results
    else
      render action: :index
    end
  end

  private
    def setup
      @answer = Answer.new(answers: params[:answers])
    end

end
