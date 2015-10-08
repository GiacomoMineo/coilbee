class RenameSuggestionsToInvitations < ActiveRecord::Migration
  def change
    rename_table :suggestions, :invitations
  end
end
