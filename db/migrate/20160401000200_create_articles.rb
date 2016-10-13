class CreateArticles < ActiveRecord::Migration[5.0]

  def change
    create_table :articles do |t|
      t.boolean :published, default: false
      t.datetime :published_at, index: true

      t.string :banner
      t.string :header, null: false, index: true
      t.text :annotation
      t.text :content, null: false

      t.string :title
      t.string :keywords, limit: 80
      t.string :description, limit: 80

      t.timestamps
    end
  end

end
