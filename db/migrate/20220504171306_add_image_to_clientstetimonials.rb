class AddImageToClientstetimonials < ActiveRecord::Migration[6.1]
  def change
    add_column :clientstetimonials, :image, :string
  end
end
