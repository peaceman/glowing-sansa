class AddContactMailToLodge < ActiveRecord::Migration
  def change
    add_column :lodges, :contact_mail, :string
  end
end
