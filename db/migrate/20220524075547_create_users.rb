class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string  :authentication_token, limit: 30

      t.timestamps
    end
  end
end
