class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.bigint :author_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
