class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_reader
  has_many :subscriptions
  has_many :libraries, through: :subscriptions
  has_many :libraries_created, :class_name => "Library", :foreign_key => "creator_id"
  has_many :suggestions_created, :class_name => "Suggestion", :foreign_key => "creator_id"
  has_many :suggestions_received, :class_name => "Suggestion", :foreign_key => "receiver_id"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def role_symbols
    (roles || []).map{|r| r.title.to_sym}.append(:user)
  end

end
