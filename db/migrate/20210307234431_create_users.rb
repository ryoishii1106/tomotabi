class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :dm
      t.string :roles
      t.integer :reviews_count

      t.timestamps
    end
  end
end
