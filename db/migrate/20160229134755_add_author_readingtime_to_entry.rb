class AddAuthorReadingtimeToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :author, :string, :default => ""
    add_column :entries, :readingtime, :integer, :default => 0
  end
end
