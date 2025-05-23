class CreateAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses, id: false do |t|
      t.string :cep, primary_key: true
      t.string :street
      t.string :neighborhood
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
