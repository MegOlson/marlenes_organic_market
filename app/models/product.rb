class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :cost, :country, :presence => true
  scope :recent_products, -> { where("created_at >= ?", (DateTime.now - 7.days)).order(created_at: :desc).limit(3)}
  scope :american_products, -> { where("country = ?", ("USA"))}
  scope :most_reviews, -> {(
    select("products.id, products.name, products.cost, products.country, count(reviews.id) as reviews_count")
    .joins(:products)
    .group("reviews.id")
    .limit(1)
    )}
end
