collection @lodges, :root => :lodges, :object_root => false
attributes :id, :name, :description, :registration_number, :grand_lodge_id
node :address do |l|
    {:address => l.address, :address_2 => l.address_2, :city => l.city, :country => l.country}
end

node :contact do |l|
    {:phone => l.phone_number, :mail => l.contact_mail}
end

node :location do |l|
    {:lat => l.latitude, :lon => l.longitude}
end

child :events => :events do |e|
    attributes :name, :description, :start_time
    node :ical do |e|
        e.schedule.to_ical
    end
end