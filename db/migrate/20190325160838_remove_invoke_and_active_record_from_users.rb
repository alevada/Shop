class RemoveInvokeAndActiveRecordFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :invoke
    remove_column :users, :active_record
  end
end
