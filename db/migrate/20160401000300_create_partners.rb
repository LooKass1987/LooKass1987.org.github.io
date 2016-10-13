class CreatePartners < ActiveRecord::Migration[5.0]

  def change
    create_table :partners do |t|
      t.boolean :published, default: false, index: true
      t.integer :index, default: 0, index: true

      t.string :logotype

      t.string :name, null: false, index: {unique: true}
      t.text :content

      t.string :phone
      t.string :email
      t.string :address
      t.string :website

      t.timestamps
    end
  end

end
