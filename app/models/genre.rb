class Genre < ApplicationRecord

  has_many :items, dependent: :destroy

  validates :name, presence: { message: 'を選択してください。' }

end
