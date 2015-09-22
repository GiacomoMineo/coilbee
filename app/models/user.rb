class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_reader
  has_many :subscriptions
  has_many :libraries, through: :subscriptions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
