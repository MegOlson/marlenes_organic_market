class Review < ActiveRecord::Base
  belongs_to :products
  validates :author, :content, :rating, :presence => true
  validates :content, {:presence => true, :length => { :minimum => 50, :maximum => 250 }}
  validates :rating, :inclusion => 1..5
end
