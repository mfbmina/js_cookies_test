class CreateCookies < ActiveRecord::Migration
  def change
    create_table :cookies do |t|
      t.string :uid
      t.string :url
      t.datetime :access_time

      t.timestamps null: false
    end
  end
end
