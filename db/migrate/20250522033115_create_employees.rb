class CreateEmployees < ActiveRecord::Migration[8.0]
  def change
    create_table :employees do |t|
      t.string :user_cpf, null: false

      t.string  :status
      t.decimal :salary
      t.string  :role
      t.string  :shift

      t.timestamps
    end

    add_foreign_key :employees, :users,
      column: :user_cpf,
      primary_key: "cpf",
      on_delete: :cascade

    add_index :employees, :user_cpf
  end
end
