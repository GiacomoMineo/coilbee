class Library < ActiveRecord::Base
  	extend FriendlyId
  	friendly_id :topic, use: [:slugged, :finders]

	has_many :categories
	has_many :groups
	has_many :invitations
	has_many :tags
	has_many :subscriptions
  	has_many :users, through: :subscriptions
  	belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"
  	has_and_belongs_to_many :moderators, :class_name => "User"

  def should_generate_new_friendly_id?
    topic_changed? || super
  end

end
