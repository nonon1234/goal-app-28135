class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :title,          null: false
      t.text :description,      null: false
      t.date :deadline,         null: false
      t.integer :progress,      default: 0
      t.boolean :done,          default: false, null: false
      t.boolean :important,     default: false, null: false
      t.references :user,       null: false, foreign_key: true

      t.timestamps
    end
  end
end
