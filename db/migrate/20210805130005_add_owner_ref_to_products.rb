class AddOwnerRefToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference( :products, :owner, foreign_key:  { to_table: :users }) 
  end
end
