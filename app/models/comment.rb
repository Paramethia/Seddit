class Comment < ApplicationRecord
    belongs_to :sed
    belongs_to :user

    validates :content, presence: true
    validates :commenter, presence: true
end
