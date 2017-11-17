class Review < ActiveRecord::Base
  validates :author, :content, :rating, :presence => true
end
