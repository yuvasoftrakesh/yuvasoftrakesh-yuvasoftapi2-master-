class CreateDesignations < ActiveRecord::Migration[6.1]
  def change
    create_table :designations, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
