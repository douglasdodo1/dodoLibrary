class User < ApplicationRecord
  has_one :employee
  has_one :client
  has_many :user_addresses
  has_many :addresses, through: :user_addresses
  has_many :loans
  has_many :borrowed_books, through: :loans, source: :book
end
