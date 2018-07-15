class WordsController < ApplicationController

  before_action :find_word, only: [:edit, :update]
  before_action :authenticate_user!, :only => [:new, :match, :check_up]

  def index
    @units = Unit.all.order("unit_number ASC")
    @words = Word.unit_or_search(params[:commit], params[:word]).order('created_at DESC').page(params[:page]).per(5)
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

  def matching
    if params[:commit].present? && params[:commit] == 'View error log'
      @words = Word.where('mistake =?', 2)
      @word_synonym = []
    elsif Word.where(mistake: [0, nil]).where(exist_num: 1).present?
      @words = Word.where(mistake: [0, nil]).where(exist_num: 1).order("RAND()").page(params[:page]).per(6)
      @word_synonym = @words.sample(6).map{|w| w.synonym.split(',').sample}
    else
      @words = Word.where(mistake: [0, nil]).order("RAND()").page(params[:page]).per(6)
      @word_synonym = @words.sample(6).map{|w| w.synonym.split(',').sample}
    end

  end

  def renew_word
    Word.where("mistake !=?", 0).update_all(["mistake =?", 0])
    redirect_to match_words_path
  end

  def check_up
    @word = Word.find(params[:id])
    @synonym = params[:word][:synonym]
    @user = current_user
    if @word.is_synonym?(@synonym)
      @word.mistake = 1
    else
      @word.mistake = 2
      @word.mistake_records.create!(word_id: @word.id, user_id: @user.id)
    end
    @word.save
  end

  private

  def find_word
    @word = Word.find(params[:id])
  end

  def word_params
    params.require(:word).permit(:spelling, :meaning, :word_type, :sentence, :synonym, :mistake, :exist_num)
  end
end
