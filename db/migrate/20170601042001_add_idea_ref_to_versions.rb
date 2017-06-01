class AddIdeaRefToVersions < ActiveRecord::Migration[5.0]
  def change
    add_reference :ideas, foriegn_key: true
  end
end
