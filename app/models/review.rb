class Review < ActiveRecord::Base
  belongs_to :products
  validates :author, :content, :rating, :presence => true
end
