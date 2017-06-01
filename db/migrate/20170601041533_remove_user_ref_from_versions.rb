class RemoveUserRefFromVersions < ActiveRecord::Migration[5.0]
  def change
    remove_reference :users, foreign_key: true
  end
end
