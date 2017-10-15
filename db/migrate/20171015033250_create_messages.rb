class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :sender,    null: false, foreign_key: { to_table: :users }
      t.references :recipient, null: false, foreign_key: { to_table: :users }
      t.references :parent, foreign_key: { to_table: :messages }
      t.text       :text
      t.timestamps
      t.datetime   :deleted_at
    end
  end
end
