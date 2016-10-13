class CreateStages < ActiveRecord::Migration[5.0]

  def change
    create_table :stages do |t|
      t.string :operate, limit: 2
      t.date :operate_at, null: false, index: true
      t.string :operation
      t.date :passed_at

      t.references :resource, polymorphic: true

      t.timestamps
    end
  end

end
