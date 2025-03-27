class Sed < ApplicationRecord
    extend FriendlyId
    friendly_id :title

    belongs_to :subseddit
    belongs_to :user

    validates :title, presence: true
    validates :content, presence: true
    validates :subseddit_name, presence: true
    validates :sedder, presence: true

    has_one_attached :image, service_metadata: { public: true }, dependent: :destroy
    
    has_many :points, dependent: :destroy
    has_many :comments, dependent: :destroy
    def total_points
      points.sum(:value)
    end



    def validate_image_type
      return unless image.attached?
        
      if !image.content_type.in?(%w[image/png image/jpg image/jpeg image/gif])
        errors.add(:image, "must be a PNG, JPG, or GIF file")
      end
    end
end
