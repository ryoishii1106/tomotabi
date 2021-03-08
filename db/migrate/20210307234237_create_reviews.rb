class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.bigint :article_id
      t.bigint :user_id
      t.string :body

      t.timestamps
    end
  end
end
