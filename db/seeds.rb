# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
grand_lodges = [
    'Großloge der Alten Freien und Angenommenen Maurer von Deutschland (GL AFuAMvD)',
    'Große Landesloge der Freimaurer von Deutschland (GLL FvD)',
    'Große National-Mutterloge "Zu den drei Weltkugeln" (GNML 3WK)',
    'American Canadian Grand Lodge A.F. & A.M (ACGL)',
    'Grand Lodge of British Freemasons in Germany (GL BFG)',
]

grand_lodges.each do |gl|
  GrandLodge.find_or_create_by_name(gl)
end

User.create(email: 'foo@lol.com', password: 'CrapLord')
