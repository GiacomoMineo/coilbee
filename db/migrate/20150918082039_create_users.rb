class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.string :role
      t.timestamps null: false
    end
    
    # make user names and emails unique, as server side validation
    # cannot exclude race conditions
    # see http://guides.rubyonrails.org/active_record_validations.html#uniqueness
	add_index :users, :email, :unique => true
	add_index :users, :user_name, :unique => true
  end
end
