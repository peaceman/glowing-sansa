class AddPhoneNumberToLodge < ActiveRecord::Migration
  def change
    add_column :lodges, :phone_number, :string
  end
end
