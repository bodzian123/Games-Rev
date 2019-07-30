class Music < ApplicationRecord
  belongs_to :user
  has_many :opinions, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 1 }
end
