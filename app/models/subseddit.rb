class Subseddit < ApplicationRecord
    extend FriendlyId
    friendly_id :name

    validates :name, presence: true, uniqueness: true
    validates :description, presence: true

    belongs_to :user
    has_many :seds
    has_many :memberships
    has_many :members, through: :memberships, source: :user

    after_create :add_owner_to_members

    def add_owner_to_members
        owner_user = User.find_by(username: owner) # Find user by username
        memberships.create(user: owner_user) if owner_user && !memberships.exists?(user: owner_user)
    end      

    def should_generate_new_friendly_id?
        title_changed? || slug.blank?
    end
end
