class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:avatar,:name,:mobile_number,:dob,:address
  mount_uploader :avatar, ImageUploader
  # attr_accessible :title, :body
  has_many :tasks

  validates :mobile_number,:presence => true,:numericality => true,:length => { :minimum => 10, :maximum => 15 }
end
