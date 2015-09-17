# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



c1 = Category.create(name: "Entrepreneurship")
c2 = Category.create(name: "Getting Started")
c3 = Category.create(name: "Team")


s1 = Section.create(name: "E-Section 1", category_id: c1.id)
s2 = Section.create(name: "E-Section 2", category_id: c1.id)
s3 = Section.create(name: "E-Section 3", category_id: c1.id)


s4 = Section.create(name: "G-Section 1", category_id: c2.id)
s5 = Section.create(name: "G-Section 2", category_id: c2.id)
s6 = Section.create(name: "G-Section 3", category_id: c2.id)


s7 = Section.create(name: "T-Section 1", category_id: c3.id)
s8 = Section.create(name: "T-Section 2", category_id: c3.id)
s9 = Section.create(name: "T-Section 3", category_id: c3.id)


e1 = Entry.create(title: "This is link title1", link: "www.example1.com", description: "Example description of link1", rating: 1)
e2 = Entry.create(title: "This is link title2", link: "www.example2.com", description: "Example description of link2", rating: 3)
e3 = Entry.create(title: "This is link title3", link: "www.example3.com", description: "Example description of link3", rating: 5)
e4 = Entry.create(title: "This is link title4", link: "www.example4.com", description: "Example description of link4", rating: 4)
e5 = Entry.create(title: "This is link title5", link: "www.example5.com", description: "Example description of link5", rating: 2)
e6 = Entry.create(title: "This is link title6", link: "www.example6.com", description: "Example description of link6", rating: 3)
e7 = Entry.create(title: "This is link title7", link: "www.example7.com", description: "Example description of link7", rating: 1)
e8 = Entry.create(title: "This is link title8", link: "www.example8.com", description: "Example description of link8", rating: 5)
e9 = Entry.create(title: "This is link title9", link: "www.example9.com", description: "Example description of link9", rating: 2)
e10 = Entry.create(title: "This is link title10", link: "www.example10.com", description: "Example description of link10", rating: 3)

s1.entries << [e1, e3, e5, e10]
s2.entries << [e2, e3, e4, e5, e6]
s3.entries << [e4, e5, e8, e7, e9]
s4.entries << [e5, e3, e8, e7, e9]
s5.entries << [e4, e5, e8, e7, e9]
s6.entries << [e2, e4, e8, e7, e9]
s7.entries << [e1, e3, e8, e7, e9]
s8.entries << [e3, e6, e8, e7, e9]
s9.entries << [e10]
