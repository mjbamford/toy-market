class AddImageToToy < ActiveRecord::Migration[5.1]
  def up
    add_attachment :toys, :image
  end

  def down
    remove_attachment :toys, :image
  end
end
