class Lodge < ActiveRecord::Base
  mount_uploader :image, LodgeImageUploader

  validates :name, presence: true, length: {minimum: 4}
  validates :description, presence: true
end
