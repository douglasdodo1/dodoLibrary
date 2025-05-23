class CreateStates < ActiveRecord::Migration[8.0]
  def change
    create_table :states do |t|
      t.string :name
      t.string :string
      t.string :uf

      t.timestamps
    end
  end
end
