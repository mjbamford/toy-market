class AddUsersToToys < ActiveRecord::Migration[5.1]
  def change
    add_reference :toys, :seller, null: false
    add_foreign_key :toys, :users, column: :seller_id

    add_reference :toys, :buyer
    add_foreign_key :toys, :users, column: :buyer_id
  end
end
