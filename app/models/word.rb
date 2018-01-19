class Word < ApplicationRecord
  belongs_to :unit

  def is_synonym?(synonym)
    self.synonym.split(',').include?(synonym)
  end
end
