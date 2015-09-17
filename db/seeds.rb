# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

e1 = Entry.create(title: "Google Search Engine", link: "www.google.com", description: "Nice search enginge you should try!", rating: 5)

e2 = Entry.create(title: "Wikipedia", link: "www.wikipedia.org", description: "Nice encyclopedia", rating: 4)

c1 = Category.create(name: "Entrepreneurship")
Section.create(name: "E-Section 1", category_id: c1.id)
Section.create(name: "E-Section 2", category_id: c1.id)
Section.create(name: "E-Section 3", category_id: c1.id)

c2 = Category.create(name: "Getting Started")
Section.create(name: "G-Section 1", category_id: c2.id)
Section.create(name: "G-Section 2", category_id: c2.id)
Section.create(name: "G-Section 3", category_id: c2.id)

c3 = Category.create(name: "Team")
Section.create(name: "T-Section 1", category_id: c3.id)
Section.create(name: "T-Section 2", category_id: c3.id)
Section.create(name: "T-Section 3", category_id: c3.id)
