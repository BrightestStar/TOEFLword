class Word < ApplicationRecord

#mistake string 检查类型（正确错误，未检查）

  belongs_to :unit

  def is_synonym?(synonym)
    self.synonym.split(',').include?(synonym)
  end

end
