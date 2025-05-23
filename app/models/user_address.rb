class UserAddress < ApplicationRecord
  belongs_to :user, foreign_key: "user_cpf", primary_key: "cpf"
  belongs_to :address, foreign_key: "address_cep", primary_key: "cep"
end
