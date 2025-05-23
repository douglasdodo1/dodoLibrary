class CreatePhones < ActiveRecord::Migration[8.0]
  def change
    create_table :phones do |t|
      t.string :user_cpf, null: false
      t.string :number
      t.timestamps
    end

    add_foreign_key :phones, :users,
    column: :user_cpf,
    primary_key: "cpf",
    on_delete: :cascade

    add_index :phones, :user_cpf
  end
end
