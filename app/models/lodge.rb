class Lodge < ActiveRecord::Base
  mount_uploader :image, LodgeImageUploader
  acts_as_gmappable :process_geocoding => :geocode?, :msg => "Sorry, not even Google could figure out where that is",
                    :address => :address, :callback => :geocoding_callback

  has_many :events, :foreign_key => 'lodge_id', :class_name => 'LodgeEvent'
  belongs_to :grand_lodge
  belongs_to :user

  phony_normalize :phone_number, :default_country_code => 'DE'
  phony_normalized_method :phone_number

  validates :name, presence: true, length: {minimum: 4}, :uniqueness => true
  validates :registration_number, :presence => true, :uniqueness => true
  validates :description, presence: true
  validates :street, :street_nr, :city, :country, :grand_lodge_id, presence: true
  validates_plausible_phone :phone_number
  validates_url :site_url, :allow_nil => true
  validates :contact_mail, email: true, :allow_nil => true

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
