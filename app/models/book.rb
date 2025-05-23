class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher
  belongs_to :language
  belongs_to :status
  has_many :book_genres
  has_many :genres, through: :book_genres
  has_many :loans
  has_many :borrowers, through: :loans, source: :user
end
