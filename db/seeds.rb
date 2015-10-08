# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "declarative_authorization/maintenance"

#wrap your whole seed file in this
Authorization::Maintenance::without_access_control do

roles = Role.create([
  {title: 'admin'},
  {title: 'user'}
]) if Role.count == 0


admin = User.create(user_name: 'admin', email: 'admin@gmail.com', password: 'password')
editor = User.create(user_name: 'editor', email: 'editor@gmail.com', password: 'password')
user = User.create(user_name: 'user', email: 'user@gmail.com', password: 'password')

admin.roles << [Role.find_by(title: 'admin')]

l1 = Library.create(topic: "Start Up", description: "This is a library about everything regarding start ups!", creator_id: editor.id)
l2 = Library.create(topic: "Cooking", description: "This is a library about everything regarding cooking!", creator_id: editor.id)

l1.moderators << [admin, user]

g1 = Group.create(name: "read", library_id: l1.id)
g2 = Group.create(name: "watch", library_id: l1.id)
g3 = Group.create(name: "learn", library_id: l1.id)
g4 = Group.create(name: "make", library_id: l1.id)


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


e1 = Entry.create(title: "How to Write a Git Commit Message", link: "http://chris.beams.io/posts/git-commit/", description: "A project's long-term success rests (among other things) on its maintainability, and a maintainer has few tools more powerful than his project's log. It's worth taking the time to learn how to care for one properly. What may be a hassle at first soon becomes habit, and eventually a source of pride and productivity for all involved.", section_id: s1.id, group_id: g1.id)
User.all.each {|u| e1.upvote_by u} # this is a really popular link!
e2 = Entry.create(title: "This is link title2", link: "http://www.example2.com", description: "Example description of link2", section_id: s1.id, group_id: g1.id, accepted: true)
e3 = Entry.create(title: "This is link title3", link: "http://www.example3.com", description: "Example description of link3", section_id: s1.id, group_id: g1.id, accepted: true)
e4 = Entry.create(title: "This is link title4", link: "http://www.example4.com", description: "Example description of link4", section_id: s1.id, group_id: g2.id, accepted: true)
e5 = Entry.create(title: "This is link title5", link: "http://www.example5.com", description: "Example description of link5", section_id: s1.id, group_id: g2.id, accepted: true)
e6 = Entry.create(title: "This is link title6", link: "http://www.example6.com", description: "Example description of link6", section_id: s1.id, group_id: g2.id, accepted: true)
e7 = Entry.create(title: "This is link title7", link: "http://www.example7.com", description: "Example description of link7", section_id: s1.id, group_id: g3.id, accepted: true)
e8 = Entry.create(title: "This is link title8", link: "http://www.example8.com", description: "Example description of link8", section_id: s1.id, group_id: g3.id, accepted: true)
e9 = Entry.create(title: "This is link title9", link: "http://www.example9.com", description: "Example description of link9", section_id: s1.id, group_id: g4.id, accepted: true)
e10 = Entry.create(title: "This is link title10", link: "http://www.example10.com", description: "Example description of link10", section_id: s1.id, group_id: g4.id , accepted: true)

t1 = Tag.create(name: "Tag1", library: l1)
t2 = Tag.create(name: "Tag2", library: l1)
t3 = Tag.create(name: "Tag3", library: l1)
t4 = Tag.create(name: "Tag4", library: l1)
t5 = Tag.create(name: "Tag5", library: l1)
t6 = Tag.create(name: "Tag6", library: l1)
t7 = Tag.create(name: "Tag7", library: l1)
t8 = Tag.create(name: "Tag8", library: l1)
t9 = Tag.create(name: "Tag9", library: l1)
t10 = Tag.create(name: "Tag10", library: l1)

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

admin.libraries << [l1,l2]
editor.libraries << [l1,l2]
user.libraries << [l2]

inv1 = Invitation.create(library_id: l1.id, creator_id: admin.id, receiver_id: user.id)

end
