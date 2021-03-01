class RemoveInstallsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :installs
  end
end
