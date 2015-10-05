class CreateEsuggestions < ActiveRecord::Migration
  def change
    create_table :esuggestions do |t|

      t.timestamps null: false
    end
  end
end
