class RemoveCategoryFromCompanyEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :company_events, :category, :string
  end
end
