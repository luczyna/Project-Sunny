class CreateVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :versions do |t|
      t.integer :number
      t.text :content
      t.references :user, foreign_key: true
      t.text :goal

      t.timestamps
    end
  end
end
