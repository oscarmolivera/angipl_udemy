class WordsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :destroy
  before_action :set_word, only: %i[edit show update destroy]
  before_action :authenticate_user!, only: %i[new create edit destroy]

  def index
    @words = Word.all
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    @word.user = current_user
    if @word.save
      redirect_to(words_path)
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    if @word.update(word_params)
      redirect_to words_path
    else
      render :edit
    end
  end

  def destroy
    @word.destroy
    redirect_to @word
  end

  private

  def word_params
    params.require(:word).permit(:content, :language_id)
  end

  def set_word
    @word = Word.find(params[:id])
  end
end
