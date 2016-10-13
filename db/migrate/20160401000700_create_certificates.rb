class CreateCertificates < ActiveRecord::Migration[5.0]

  def change
    create_table :certificates do |t|
      t.boolean :active, default: false, index: true
      t.integer :status, limit: 2, default: 0, index: true

      t.string  :number, limit: 32, null: false, index: {unique: true}
      t.text    :object, null: false

      t.string  :classifier, limit: 32
      t.string  :classifier_code, limit: 32
      t.string  :grouping, limit: 32

      t.date    :issued_at
      t.date    :closed_at

      t.references :customer, foreign_key: {on_delete: :nullify}
      t.references :agent, foreign_key: {on_delete: :nullify}

      t.timestamps
    end
  end
end
