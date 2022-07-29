class CreateCompanyEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :company_events, id: :uuid do |t|
      t.string :category
      t.text :description
      t.string :title
      t.string :date
      t.string :location

      t.timestamps
    end
  end
end
