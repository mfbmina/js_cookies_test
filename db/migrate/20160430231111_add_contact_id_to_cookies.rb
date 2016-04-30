class AddContactIdToCookies < ActiveRecord::Migration
  def change
    add_reference :cookies, :contact, index: true, foreign_key: true
  end
end
