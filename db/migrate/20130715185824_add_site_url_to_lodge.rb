class AddSiteUrlToLodge < ActiveRecord::Migration
  def change
    add_column :lodges, :site_url, :string
  end
end
