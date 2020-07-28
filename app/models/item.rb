class Item < ApplicationRecord
  has_one :category
  has_one :management
  has_many :users

  with_options presence: true do
    validates :name
    validates :explanation
    validates :price_id
    validates :condition_id
    validates :postage_id
    validates :size
    validates :customer
    validates :category
    validates :user 
  end

  validate :image_presence
  
  def image_presence
    if image.attached?
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, 'にはjpegまたはpngファイルを添付してください')
      end
    else
      errors.add(:image, 'ファイルを添付してください')
    end
  end
end
