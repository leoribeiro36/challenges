#encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Hero.count == 0
	l1  = Location.create(lat: "-5,836597".to_f, lng: "-35.236007".to_f)
	l2  = Location.create(lat: "-70.95152".to_f, lng: "-21.63929".to_f)
	l3  = Location.create(lat: "18.87673".to_f,  lng: "31.10426".to_f)
	l4  = Location.create(lat: "25.67136".to_f,  lng: "103.70505".to_f)
	l5  = Location.create(lat: "-53.05137".to_f, lng: "-91.02243".to_f)
	l6  = Location.create(lat: "7.10489".to_f,   lng: "-143.70642")
	l7  = Location.create(lat: "13.77157".to_f,  lng: "7.45633".to_f)
	l8  = Location.create(lat: "-11.80633".to_f, lng: "49.00288".to_f)
	l9  = Location.create(lat: "62.79988".to_f,  lng: "-166.40456".to_f)
	l10 = Location.create(lat: "-13.89509".to_f, lng: "139.03355".to_f)
	l11 = Location.create(lat: "43.43997".to_f,  lng: "28.77630".to_f)
	l12 = Location.create(lat: "-33.70809".to_f, lng: "-114.83867".to_f)

	Hero.create(name: "Silver Fang",	  rank: "S", location: l1)
	Hero.create(name: "King",       	  rank: "S", location: l2)
	Hero.create(name: "Genos",      	  rank: "S", location: l3)
	Hero.create(name: "Stinger",    	  rank: "A", location: l4)
	Hero.create(name: "Smile Man",  	  rank: "A", location: l5)
	Hero.create(name: "Spring Mustachio", rank: "A", location: l6)
	Hero.create(name: "Saitama",          rank: "B", location: l7)
	Hero.create(name: "Blizzard of Hell", rank: "B", location: l8)
	Hero.create(name: "Pineapple",        rank: "B", location: l9)
	Hero.create(name: "Mumen Rider",      rank: "C", location: l10)
	Hero.create(name: "Tanktop Tiger",    rank: "C", location: l11)
	Hero.create(name: "D-pad",            rank: "C", location: l12)
end
