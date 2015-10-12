class AddSlugToSections < ActiveRecord::Migration
  def change
    add_column :sections, :slug, :string
    add_index :sections, :slug
  end
end
