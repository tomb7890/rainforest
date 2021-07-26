require 'csv'
data=CSV.read("data/jcpenney_com-ecommerce_sample.csv", headers: true)

def create_a_user
  User.create!({
                 email: "jcpenny.shopper@example.com",
                 name: "Susie McDonald",
                 password: "pass",
                 password_confirmation: "pass"
               }
              )
end

index = 0
while true
  index = index + 1

  unless data[index]['name_title'].blank? ||
         data[index]['description'].blank? ||
         data[index]['list_price'].blank?

    unless Product.find_by(description: data[index]['description'])
      Product.create({
                       name: data[index]['name_title'],
                       description: data[index]['description'],
                       price_in_cents: data[index]['list_price'].to_i * 100
                     }
                    )
    end

    if Product.all.size > 300
      break
    end
  end
end
