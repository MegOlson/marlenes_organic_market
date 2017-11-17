class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :cost, :country, :presence => true
end
