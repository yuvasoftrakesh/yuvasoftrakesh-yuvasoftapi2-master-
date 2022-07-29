class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.bigint :contact
      t.string :email
      t.string :designation
      t.text :description

      t.timestamps
    end
  end
end
