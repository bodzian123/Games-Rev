class Music < ApplicationRecord
  has_many :opinions, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 1 }
end
