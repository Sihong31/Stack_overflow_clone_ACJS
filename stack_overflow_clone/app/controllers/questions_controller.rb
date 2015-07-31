class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    question.user_id = 1
    tags = params[:tags].split(',')
    p "**************"
    tags.each do |tag|
      question.tags << Tag.create(name: tag)
    end
    p "**************"
    if question.save
      redirect_to root_path
    else
      redirect_to "http://www.google.com"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
