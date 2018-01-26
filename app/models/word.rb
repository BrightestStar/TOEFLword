class Word < ApplicationRecord

#mistake string 检查类型（正确错误，未检查）

  belongs_to :unit

  has_many :mistake_records
  has_many :users, through: :mistake_records

  def is_synonym?(synonym)
    self.synonym.split(',').include?(synonym)
  end

  def self.unit_or_search(button_attr, word)
    if button_attr == 'Search'
      where("spelling LIKE ?", "%#{word}%").includes(:unit, {:mistake_records => :user})
    elsif button_attr.present? && button_attr.include?('Unit')
      unit_num = button_attr.split(" ").last
      @unit = Unit.find_by_unit_number(unit_num)
      @words = @unit.words.includes(:unit, {:mistake_records => :user})
    else
      all.includes(:unit, {:mistake_records => :user})
    end
  end

end
