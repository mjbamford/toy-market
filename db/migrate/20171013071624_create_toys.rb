class CreateToys < ActiveRecord::Migration[5.1]
  def change
    create_table :toys do |t|
      t.string     :name, null: false
      t.text       :description
      t.string     :state, default: 'draft'
      t.decimal    :price, scale: 2, precision: 8, default: 0.0
      t.timestamps
    end
  end
end
