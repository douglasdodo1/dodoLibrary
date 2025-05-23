class CreateUserAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :user_addresses do |t|
      t.string :user_cpf, null: false
      t.string :address_cep, null: false

      t.string :number
      t.string :complement

      t.timestamps
    end
      add_foreign_key :user_addresses, :users,
      column: :user_cpf,
      primary_key: "cpf",
      on_delete: :cascade

      add_index :user_addresses, :user_cpf

      add_foreign_key :user_addresses, :addresses,
      column: :address_cep,
      primary_key: "cep",
      on_delete: :cascade

      add_index :user_addresses, :address_cep
  end
end
