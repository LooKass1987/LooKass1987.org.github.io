class CreateAttestats < ActiveRecord::Migration[5.0]

  def change
    create_table :attestats do |t|
      t.boolean :active, default: false, index: true
      t.integer :status, limit: 2, default: 0, index: true

      t.string  :number, limit: 32, null: false, index: {unique: true}
      t.text    :object, null: false

      t.date    :issued_at
      t.date    :closed_at

      t.references :customer, foreign_key: {on_delete: :nullify}
      t.references :agent, foreign_key: {on_delete: :nullify}

      t.timestamps
    end
  end

end
