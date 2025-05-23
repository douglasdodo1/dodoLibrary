class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users, id: false do |t|
      t.string :cpf, primary_key: true
      t.string :name
      t.integer :age
      t.string :gender
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
