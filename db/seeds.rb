# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(first_name: 'admin', last_name: 'admin', user_name: 'admin', email: 'admin@gmail.com', password: 'password', role: 'admin')
editor = User.create(first_name: 'editor', last_name: 'editor', user_name: 'editor', email: 'editor@gmail.com', password: 'password', role: 'editor')
admin = User.create(first_name: 'user', last_name: 'user', user_name: 'user', email: 'user@gmail.com', password: 'password')


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


e1 = Entry.create(title: "This is link title1", link: "www.example1.com", description: "Example description of link1", rating: 1, section_id: s1.id)
e2 = Entry.create(title: "This is link title2", link: "www.example2.com", description: "Example description of link2", rating: 3, section_id: s1.id)
e3 = Entry.create(title: "This is link title3", link: "www.example3.com", description: "Example description of link3", rating: 5, section_id: s2.id)
e4 = Entry.create(title: "This is link title4", link: "www.example4.com", description: "Example description of link4", rating: 4, section_id: s2.id)
e5 = Entry.create(title: "This is link title5", link: "www.example5.com", description: "Example description of link5", rating: 2, section_id: s3.id)
e6 = Entry.create(title: "This is link title6", link: "www.example6.com", description: "Example description of link6", rating: 3, section_id: s3.id)
e7 = Entry.create(title: "This is link title7", link: "www.example7.com", description: "Example description of link7", rating: 1, section_id: s4.id)
e8 = Entry.create(title: "This is link title8", link: "www.example8.com", description: "Example description of link8", rating: 5, section_id: s5.id)
e9 = Entry.create(title: "This is link title9", link: "www.example9.com", description: "Example description of link9", rating: 2, section_id: s6.id)
e10 = Entry.create(title: "This is link title10", link: "www.example10.com", description: "Example description of link10", rating: 3, section_id: s7.id)

t1 = Tag.create(name: "Tag1")
t2 = Tag.create(name: "Tag2")
t3 = Tag.create(name: "Tag3")
t4 = Tag.create(name: "Tag4")
t5 = Tag.create(name: "Tag5")
t6 = Tag.create(name: "Tag6")
t7 = Tag.create(name: "Tag7")
t8 = Tag.create(name: "Tag8")
t9 = Tag.create(name: "Tag9")
t10 = Tag.create(name: "Tag10")

e1.tags << [t1, t2, t3, t4]
e2.tags << [t4, t5, t6, t7]
e3.tags << [t8, t9, t10]
e4.tags << [t1, t2, t3, t4]
e5.tags << [t4, t5]
e6.tags << [t6, t7, t8, t9]
e7.tags << [t10]
e8.tags << [t1, t4]
e9.tags << [t1, t2, t3, t4]
e10.tags << [t4]

#s1.entries << [e1, e3, e5, e10]
#s2.entries << [e2, e3, e4, e5, e6]
#s3.entries << [e4, e5, e8, e7, e9]
#s4.entries << [e5, e3, e8, e7, e9]
#s5.entries << [e4, e5, e8, e7, e9]
#s6.entries << [e2, e4, e8, e7, e9]
#s7.entries << [e1, e3, e8, e7, e9]
#s8.entries << [e3, e6, e8, e7, e9]
#s9.entries << [e10]
