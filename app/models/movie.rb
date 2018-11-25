class Movie < ApplicationRecord
  has_many :comentages, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 1 }
end
