class AddAbbreviationToGrandLodge < ActiveRecord::Migration
  def change
    add_column :grand_lodges, :abbreviation, :string
  end
end
