class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.text :link
      t.text :description
      t.references :section
      t.references :group
      t.boolean :accepted, :default => false
      t.timestamps null: false
    end
  end
end
