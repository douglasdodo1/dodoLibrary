class CreateClients < ActiveRecord::Migration[8.0]
  def change
    create_table :clients do |t|
      t.string :user_cpf, null: false

      t.timestamps
    end

    add_foreign_key :clients, :users,
      column: :user_cpf,
      primary_key: "cpf",
      on_delete: :cascade

    add_index :clients, :user_cpf
  end
end
