require 'csv'
require 'faker'

for b in 0..20 do
  fn = Faker::Name.name
  fe = Faker::Internet.email(name: fn)
  User.create!({
                 email: fe,
                 name: fn,
                 password: "pass",
                 password_confirmation: "pass"
               })
end

data=CSV.read("data/jcpenney_com-ecommerce_sample.csv", headers: true)
table = data.select{|row|

  !row['list_price'].blank? &&
  !row['description'].blank? &&
  !row['name_title'].blank? &&
  !row['total_number_reviews'].blank? &&
  row['total_number_reviews'].to_i > 2 }.sample(500)



def random_user
  offset = rand(User.count)
  User.offset(offset).first
end

table.each do|row|

  unless Product.find_by(description: row['description'])
    prod = Product.new({
                         name: row['name_title'],
                         description: row['description'],
                         price_in_cents: row['list_price'].to_i * 100
                     }
                    )

    prod.owner = random_user
    prod.save

    reviewstring = row["Reviews"]

    reviews_array = JSON.parse(reviewstring.gsub('=>', ':'))['review']

    for r in reviews_array
      review = Review.new(product: prod, user: random_user)
      review.comment = r.values.last
      review.save
    end
  end
end
