class CreateDrops < ActiveRecord::Migration[7.0]
  def change
    create_table :drops do |t|
      t.string   :description, null: false
      t.text     :content
      t.string   :hex, null: false, unique: true
      t.datetime :viewed_at
      t.timestamps
    end
  end
end
