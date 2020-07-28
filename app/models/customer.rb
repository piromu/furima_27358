class Customer < ApplicationRecord
  belongs_to :item

  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture
    validates :shipping_id
    validates :city
    validates :address
    validates :building
    validates :phone

  end
end
