class CreateNests < ActiveRecord::Migration
  def change
    create_table :nests do |t|
      t.belongs_to :section, index: true
      t.belongs_to :entry, index: true
      t.timestamps null: false
    end
  end
end
