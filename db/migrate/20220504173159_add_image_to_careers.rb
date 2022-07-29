class AddImageToCareers < ActiveRecord::Migration[6.1]
  def change
    add_column :careers, :image, :string
  end
end
