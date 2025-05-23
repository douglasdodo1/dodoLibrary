class CreateLoans < ActiveRecord::Migration[8.0]
  def change
    create_table :loans do |t|
      t.string :user_cpf, null: false
      t.references :book, null: false, foreign_key: true
      t.date :loan_date
      t.date :return_date
      t.boolean :returned

      t.timestamps
    end

    add_foreign_key :loans, :users,
    column: :user_cpf,
    primary_key: :cpf,
    on_delete: :cascade

    add_index :loans, :user_cpf
  end
end
