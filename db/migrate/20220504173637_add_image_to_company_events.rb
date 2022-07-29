class AddImageToCompanyEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :company_events, :image, :string
  end
end
