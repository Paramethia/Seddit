class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, authentication_keys: [:username]
  validates :username, presence: true, uniqueness: true

  has_many :seds
  has_many :subseddits

  has_many :points
  has_many :memberships
  has_many :subseddit_memberships, through: :memberships, source: :subseddit
  
end
