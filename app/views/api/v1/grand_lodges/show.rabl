object @grand_lodge
attributes :id, :name, :abbreviation
node(:amount_of_lodges) { |grand_lodge| grand_lodge.lodges.count }