class CreateUrls < ActiveRecord::Migration
  def up
    create_table :urls do |t|
    t.string "long_url"
    t.string "short_code"
    t.string "unique_views"
    t.string "ip_address"
    t.timestamps
    end
  end

  def down
    drop_table :urls
  end
end
