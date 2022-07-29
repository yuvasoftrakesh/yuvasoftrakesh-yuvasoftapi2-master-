class CreateClientstetimonials < ActiveRecord::Migration[6.1]
  def change
    create_table :clientstetimonials, id: :uuid do |t|
      t.string :name
      t.string :city
      t.text :description

      t.timestamps
    end
  end
end
