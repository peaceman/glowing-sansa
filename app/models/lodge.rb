class Lodge < ActiveRecord::Base
  mount_uploader :image, LodgeImageUploader
  acts_as_gmappable :process_geocoding => :geocode?, :msg => "Sorry, not even Google could figure out where that is",
                    :address => :full_address

  has_many :events, :foreign_key => 'lodge_id', :class_name => 'LodgeEvent'
  belongs_to :grand_lodge
  belongs_to :user

  phony_normalize :phone_number, :default_country_code => 'DE'
  phony_normalized_method :phone_number

  validates :name, presence: true, length: {minimum: 4}, :uniqueness => true
  validates :registration_number, :presence => true, :uniqueness => true
  validates :description, presence: true
  validates :address, :city, :country, :grand_lodge_id, presence: true
  validates_plausible_phone :phone_number
  validates_url :site_url, :allow_nil => true
  validates :contact_mail, email: true, :allow_nil => true

  paginates_per 25

  def full_address
    [self.address, self.address_2, self.city, self.country].keep_if {|v| !v.nil? && !v.blank? }.join ', '
  end

  def geocode?
    (latitude.blank? && longitude.blank?) || full_address_changed?
  end

  def full_address_changed?
    address_changed? || address_2_changed? || city_changed? || country_changed?
  end

  searchable do
    text :name, :description, :address, :address_2, :city
    integer :user_id
    integer :grand_lodge_id
    integer :registration_number

    latlon(:location) { Sunspot::Util::Coordinates.new(latitude, longitude)}
  end
end
