class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :isbn
      t.string :edition
      t.integer :pages
      t.integer :quantity
      t.decimal :price
      t.string :shelf_location
      t.text :summary
      t.date :release_date
      t.date :acquisition_date
      t.string :cover_image_url
      t.references :author, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
