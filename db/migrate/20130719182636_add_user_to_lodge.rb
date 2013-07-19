class AddUserToLodge < ActiveRecord::Migration
  def change
    add_reference :lodges, :user, index: true
  end
end
