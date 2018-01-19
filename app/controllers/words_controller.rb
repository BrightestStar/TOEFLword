class WordsController < ApplicationController

  before_action :find_word, only: [:edit, :update]

  def index
    @words = Word.all.includes(:unit).order('created_at DESC')
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    @unit = Unit.find(params[:word][:unit_id])
    @word.unit = @unit
    @word.save!
    redirect_to words_path
  end

  def edit
  end

  def update
    @unit = Unit.find(params[:word][:unit_id])
    @word.unit = @unit
    @word.update!(word_params)
    redirect_to words_path
  end

  def match
    @words = Word.all.sample(6)
    @word_synonym = @words.map{|w| w.synonym.split(',').sample}
  end

  def renew_word
    Word.where("mistake !=?", 0).update_all(["mistake =?", 0])
    redirect_to match_words_path
  end

  def check_up
    @word = Word.find(params[:id])
    @synonym = params[:word][:synonym]
    if @word.is_synonym?(@synonym)
      @word.mistake = 1
    else
      @word.mistake = 2
    end
    @word.save
  end

  private

  def find_word
    @word = Word.find(params[:id])
  end

  def word_params
    params.require(:word).permit(:spelling, :meaning, :word_type, :sentence, :synonym, :mistake)
  end
end
