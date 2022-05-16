class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :comment, :presence => true

  def author
    unless user.blank? 
      unless user.name.blank? 
        return user.name
      end
    else
      "Anonymous"
    end
  end

  def date
    created_at.strftime("%B %d, %Y")
  end
  
end
