class Product < ApplicationRecord

  belongs_to :owner, class_name: "User"

  has_many :reviews
  has_many :users, through: :reviews

  validates :description, :name, presence: true
  validates :price_in_cents, numericality: {only_integer: true}
  validates :price_in_cents, :numericality => { :greater_than_or_equal_to => 1 } 

  def formatted_price
    price_in_dollars = price_in_cents.to_f / 100
    sprintf("%.2f", price_in_dollars)
  end


end
