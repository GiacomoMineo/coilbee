class AddEmailToInvitations < ActiveRecord::Migration
  def change
    remove_reference :invitations, :receiver
    add_column :invitations, :receiver_email, :string
    add_index :invitations, :receiver_email, unique: true
  end
end
