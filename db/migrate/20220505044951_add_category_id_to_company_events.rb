class AddCategoryIdToCompanyEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :company_events, :category_id, :integer
  end
end
