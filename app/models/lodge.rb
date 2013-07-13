class Lodge < ActiveRecord::Base
  mount_uploader :image, LodgeImageUploader
end
