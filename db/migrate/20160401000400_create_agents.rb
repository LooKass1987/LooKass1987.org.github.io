class CreateAgents < ActiveRecord::Migration[5.0]

  def change
    create_table :agents do |t|
      t.boolean :active, default: false, index: true
      t.integer :role, limit: 1, default: 0, index: true

      t.string :name, null: false, index: {unique: true}
      t.string :email
      t.string :phone
      t.string :address

      t.references :user, foreign_key: {on_delete: :nullify}

      t.timestamps
    end
  end

end
