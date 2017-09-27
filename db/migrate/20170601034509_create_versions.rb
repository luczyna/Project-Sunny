class CreateVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :versions do |t|
      t.integer :number
      t.text :content
      t.text :goal
      t.references :idea, foreign_key: true

      t.timestamps
    end
  end
end
