class LodgeEvent < ActiveRecord::Base
  include IceCube
  
  belongs_to :lodge
end
