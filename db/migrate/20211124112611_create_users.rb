class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password, null: false
      t.boolean :accepted, null: false
      t.string :name, null: false
      t.text :self_introduction, null: true
      t.string :avatar, null: true
      t.timestamp :current_sign_in_at, null: true
      t.timestamp :deleted_at, null: true
      t.timestamps null: false
    end
  end
end
