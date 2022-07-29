class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs, id: :uuid do |t|
      t.string :category
      t.string :date
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
