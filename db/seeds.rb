Product.destroy_all
Review.destroy_all

50.times do |index|
  product = Product.create!(name: Faker::Food.ingredient, cost: Faker::Number.between(1, 10), country: Faker::HarryPotter.location, created_at: Faker::Date.between_except(1.year.ago, 1.year.from_now, 21.days.ago))

  5.times do |index|
    reviews = product.reviews.create!(author: Faker::HarryPotter.character, content: Faker::Lorem.characters(70), rating: Faker::Number.between(1, 5), created_at: Faker::Date.between_except(1.year.ago, 1.year.from_now, 21.days.ago))
  end
end

p "Created #{Product.count} products"
p "Created #{Review.count} reviews"
