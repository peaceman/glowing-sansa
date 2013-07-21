class GrandLodge < ActiveRecord::Base
  has_many :lodges, :dependent => :destroy

  validates :name, :abbreviation, :presence => true
end
