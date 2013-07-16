class GrandLodge < ActiveRecord::Base
  has_many :lodges, :dependent => :destroy
end
