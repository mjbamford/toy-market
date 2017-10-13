class CreateToys < ActiveRecord::Migration[5.1]
  def change
    create_table :toys do |t|
      t.integer    :seller_id, index: true, null: false
      t.integer    :buyer_id, index: true, null: false
      t.string     :name
      t.text       :description
      t.string     :state, default: 'draft'
      t.timestamps
    end
  end
end
