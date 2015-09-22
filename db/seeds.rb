# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(user_name: 'admin', email: 'admin@gmail.com', password: 'password')
editor = User.create(user_name: 'editor', email: 'editor@gmail.com', password: 'password')
user = User.create(user_name: 'user', email: 'user@gmail.com', password: 'password')

l1 = Library.create(topic: "Start Up", description: "This is a library about everything regarding start ups!")
l2 = Library.create(topic: "Cooking", description: "This is a library about everything regarding cooking!")

c1 = Category.create(name: "Entrepreneurship", library_id: l1.id)
c2 = Category.create(name: "Getting Started", library_id: l1.id)
c3 = Category.create(name: "Team", library_id: l1.id)


s1 = Section.create(name: "E-Section 1", category_id: c1.id)
s2 = Section.create(name: "E-Section 2", category_id: c1.id)
s3 = Section.create(name: "E-Section 3", category_id: c1.id)


s4 = Section.create(name: "G-Section 1", category_id: c2.id)
s5 = Section.create(name: "G-Section 2", category_id: c2.id)
s6 = Section.create(name: "G-Section 3", category_id: c2.id)


s7 = Section.create(name: "T-Section 1", category_id: c3.id)
s8 = Section.create(name: "T-Section 2", category_id: c3.id)
s9 = Section.create(name: "T-Section 3", category_id: c3.id)


e1 = Entry.create(title: "This is link title1", link: "http://www.example1.com", description: "Example description of link1", rating: 1, section_id: s1.id, group: 0)
e2 = Entry.create(title: "This is link title2", link: "http://www.example2.com", description: "Example description of link2", rating: 3, section_id: s1.id, group: 0)
e3 = Entry.create(title: "This is link title3", link: "http://www.example3.com", description: "Example description of link3", rating: 5, section_id: s1.id, group: 1)
e4 = Entry.create(title: "This is link title4", link: "http://www.example4.com", description: "Example description of link4", rating: 4, section_id: s1.id, group: 1)
e5 = Entry.create(title: "This is link title5", link: "http://www.example5.com", description: "Example description of link5", rating: 2, section_id: s1.id, group: 2)
e6 = Entry.create(title: "This is link title6", link: "http://www.example6.com", description: "Example description of link6", rating: 3, section_id: s1.id, group: 2)
e7 = Entry.create(title: "This is link title7", link: "http://www.example7.com", description: "Example description of link7", rating: 1, section_id: s1.id, group: 2)
e8 = Entry.create(title: "This is link title8", link: "http://www.example8.com", description: "Example description of link8", rating: 5, section_id: s1.id, group: 3)
e9 = Entry.create(title: "This is link title9", link: "http://www.example9.com", description: "Example description of link9", rating: 2, section_id: s1.id, group: 3)
e10 = Entry.create(title: "This is link title10", link: "http://www.example10.com", description: "Example description of link10", rating: 3, section_id: s1.id, group: 3)

#e1 = Entry.create(title: "This is link title1", link: "http://www.example1.com", description: "Example description of link1", rating: 1, section_id: s1.id, group: 1)
#e2 = Entry.create(title: "This is link title2", link: "http://www.example2.com", description: "Example description of link2", rating: 3, section_id: s1.id, group: 1)
#e3 = Entry.create(title: "This is link title3", link: "http://www.example3.com", description: "Example description of link3", rating: 5, section_id: s2.id, group: 2)
#e4 = Entry.create(title: "This is link title4", link: "http://www.example4.com", description: "Example description of link4", rating: 4, section_id: s2.id, group: 2)
#e5 = Entry.create(title: "This is link title5", link: "http://www.example5.com", description: "Example description of link5", rating: 2, section_id: s3.id, group: 3)
#e6 = Entry.create(title: "This is link title6", link: "http://www.example6.com", description: "Example description of link6", rating: 3, section_id: s3.id, group: 3)
#e7 = Entry.create(title: "This is link title7", link: "http://www.example7.com", description: "Example description of link7", rating: 1, section_id: s4.id, group: 3)
#e8 = Entry.create(title: "This is link title8", link: "http://www.example8.com", description: "Example description of link8", rating: 5, section_id: s5.id, group: 4)
#e9 = Entry.create(title: "This is link title9", link: "http://www.example9.com", description: "Example description of link9", rating: 2, section_id: s6.id, group: 4)
#e10 = Entry.create(title: "This is link title10", link: "http://www.example10.com", description: "Example description of link10", rating: 3, section_id: s7.id, group: 4)

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

admin.libraries << [l1,l2]
editor.libraries << [l1,l2]
user.libraries << [l1,l2]