class Movie < ApplicationRecord
  belongs_to :user
  has_many :comentages, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 1 }
end
