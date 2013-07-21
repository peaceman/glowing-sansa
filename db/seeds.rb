# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
grand_lodges = [
    {
        name: 'Großloge der Alten Freien und Angenommenen Maurer von Deutschland',
        abbreviation: 'GL AFuAMvD'
    },
    {
        name: 'Große Landesloge der Freimaurer von Deutschland',
        abbreviation: 'GLL FvD'
    },
    {
        name: 'Große National-Mutterloge "Zu den drei Weltkugeln"',
        abbreviation: 'GNML 3WK'
    },
    {
        name: 'American Canadian Grand Lodge A.F. & A.M',
        abbreviation: 'ACGL'
    },
    {
        name: 'Grand Lodge of British Freemasons in Germany',
        abbreviation: 'GL BFG'
    }
]

grand_lodges.each do |gl|
  grand_lodge = GrandLodge.find_or_initialize_by_name(gl[:name])
  grand_lodge.update(
      abbreviation: gl[:abbreviation]
  )
end

User.create(email: 'foo@user.com', password: 'CrapLord', :is_admin => false)
User.create(email: 'foo@admin.com', password: 'CrapLord', :is_admin => true)

LodgeEventCategory.create(:name => 'cat 1')
LodgeEventCategory.create(:name => 'cat 2')