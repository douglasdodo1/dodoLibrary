class Phone < ApplicationRecord
  belongs_to :user, foreign_key: "user_cpf", primary_key: "cpf"
end
