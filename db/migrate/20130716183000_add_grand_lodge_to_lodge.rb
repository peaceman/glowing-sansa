class AddGrandLodgeToLodge < ActiveRecord::Migration
  def change
    add_reference :lodges, :grand_lodge, index: true
  end
end
