class CreateJoinTableEntryTag < ActiveRecord::Migration
  def change
    create_join_table :entries, :tags do |t|
      # t.index [:entry_id, :tag_id]
      # t.index [:tag_id, :entry_id]
    end
  end
end
