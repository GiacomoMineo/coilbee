class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
    	t.references :creator, index: true
    	t.references :receiver, index: true
    	t.references :library, index: true
      t.timestamps null: false
    end
  end
end
