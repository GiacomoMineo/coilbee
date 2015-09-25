class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.text :link
      t.text :description
      t.references :section
      t.references :group
      t.timestamps null: false
    end
  end
end
