class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.text :link
      t.text :description
      t.integer :rating
      t.references :section
      t.timestamps null: false
    end
  end
end
