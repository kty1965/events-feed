class CreateFacebookPages < ActiveRecord::Migration[5.0]
  def change
    create_table :facebook_pages do |t|
      t.string :fb_id
      t.string :name
      t.string :url

      t.timestamps
    end

    add_index :facebook_pages, :fb_id, :unique => true
    add_index :facebook_pages, :url, :unique => true
  end
end
