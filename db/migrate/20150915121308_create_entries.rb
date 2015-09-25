class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.text :link
      t.text :description
      t.references :section
      t.integer :group, default: 0
      t.timestamps null: false
    end
  end
end
