class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :comments
  has_many :item_orders
  with_options presence: true do
    validates :nickname, format: { with: /\A[a-zぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
   
  end

  after_validation :check_attributes

  private
  def check_attributes
  
  end
end
