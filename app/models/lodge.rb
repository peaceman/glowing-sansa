class Lodge < ActiveRecord::Base
  mount_uploader :image, LodgeImageUploader
  acts_as_gmappable :process_geocoding => :geocode?, :msg => "Sorry, not even Google could figure out where that is", :address => :address

  validates :name, presence: true, length: {minimum: 4}
  validates :description, presence: true
  validates :street, :city, :country, presence: true

  def address
    "#{self.street}, #{self.city}, #{self.country}"
  end

  def geocode?
    (latitude.blank? && longitude.blank?) || address_changed?
  end

  def address_changed?
    street_changed? || city_changed? || country_changed?
  end
end
