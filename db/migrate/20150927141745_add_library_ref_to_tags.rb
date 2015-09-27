class AddLibraryRefToTags < ActiveRecord::Migration
  def change
    add_reference :tags, :library, index: true, foreign_key: true
  end
end
