class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :entry, index: true
      t.timestamps null: false
    end
  end
end
