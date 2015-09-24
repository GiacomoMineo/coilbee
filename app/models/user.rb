class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_reader
  has_many :subscriptions
  has_many :libraries, through: :subscriptions
  has_many :libraries_created, :class_name => "Library", :foreign_key => "created"
  has_many :suggestions_created, :class_name => "Suggestion", :foreign_key => "suggestions_created"
  has_many :suggestions_received, :class_name => "Suggestion", :foreign_key => "suggestions_received"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
