class AddOwnerRefToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :owner, foreign_key: true
  end
end
