class Lodge < ActiveRecord::Base
  mount_uploader :image, LodgeImageUploader
  acts_as_gmappable :process_geocoding => :geocode?, :msg => "Sorry, not even Google could figure out where that is",
                    :address => :address, :callback => :geocoding_callback

  validates :name, presence: true, length: {minimum: 4}
  validates :description, presence: true
  validates :street, :street_nr, :city, :country, presence: true

  def address
    [[self.street, self.street_nr].keep_if {|v| !v.nil?}.join(' '), self.city, self.country].keep_if {|v| !v.nil?}.join ', '
  end

  def geocode?
    (latitude.blank? && longitude.blank?) || address_changed?
  end

  def address_changed?
    street_changed? || city_changed? || country_changed?
  end

  def geocoding_callback(data)
    logger.info data['address_components']
    data['address_components'].each do |c|
      if c['types'].include? 'country'
        self.country = c['long_name']
      elsif c['types'].include? 'locality'
        self.city = c['long_name']
      elsif c['types'].include? 'route'
        self.street = c['long_name']
      elsif c['types'].include? 'street_number'
        self.street_nr = c['long_name']
      end
    end
  end
end
