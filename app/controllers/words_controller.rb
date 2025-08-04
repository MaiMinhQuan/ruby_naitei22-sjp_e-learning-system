class WordsController < ApplicationController
  before_action :set_word, only: [:edit, :update, :destroy]

  def index
    @words = Word.all
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)

    if @word.save
      flash[:success] = 'Word was successfully created.'
      redirect_to words_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @word.update(word_params)
      flash[:success] = 'Word was successfully updated.'
      redirect_to words_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    word_content = @word.content
    @word.destroy
    flash[:success] = "Word '#{word_content}' was successfully deleted."
    redirect_to words_path
  end

  private

  def set_word
    @word = Word.find(params[:id])
  end

  def word_params
    params.require(:word).permit(:content, :meaning, :word_type)
  end
end
