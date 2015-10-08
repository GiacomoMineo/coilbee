class CreateJoinTableLibraryUser < ActiveRecord::Migration
  def change
    create_join_table :Libraries, :Users do |t|
      # t.index [:entry_id, :tag_id]
      # t.index [:tag_id, :entry_id]
  	end
  end
end
