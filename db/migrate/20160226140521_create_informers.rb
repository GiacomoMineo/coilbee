class CreateInformers < ActiveRecord::Migration
  def change
    create_table :informers do |t|
      t.string :email

      t.timestamps null: false
    end
  end
end
