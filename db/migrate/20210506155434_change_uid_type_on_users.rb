class ChangeUidTypeOnUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :uid, :string
  end
end
