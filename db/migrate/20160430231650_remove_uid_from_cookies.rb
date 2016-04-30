class RemoveUidFromCookies < ActiveRecord::Migration
  def change
    remove_column :cookies, :uid, :string
  end
end
