class WordsController < ApplicationController

  before_action :find_word, only: [:edit, :update]

  def index
    @words = Word.all
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    @unit = Unit.first
    @word.unit = @unit
    @word.save!
    redirect_to words_path
  end

  def edit
  end

  def update
    @word.update!(word_params)
    redirect_to words_path
  end

  private

  def find_word
    @word = Word.find(params[:id])
  end

  def word_params
    params.require(:word).permit(:spelling, :unit, :meaning, :word_type, :sentence, :synonym, :mistake)
  end
end
