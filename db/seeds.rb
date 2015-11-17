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
user1 = User.create(user_name: 'user1', email: 'user1@gmail.com', password: 'password')
user2 = User.create(user_name: 'user2', email: 'user2@gmail.com', password: 'password')
user3 = User.create(user_name: 'sharingiscaring', email: 'bhg3110@yahoo.de', password: 'password')

admin.confirm
user1.confirm
user2.confirm
user3.confirm

admin.roles << [Role.find_by(title: 'admin')]
user1.roles << [Role.find_by(title: 'user')]
user2.roles << [Role.find_by(title: 'user')]
user3.roles << [Role.find_by(title: 'user')]

l1 = Library.create(
	topic: "Start Up", 
	description: "You will find around 400 handpicked links from the web that cover the main aspects of starting a business. You can suggest new links to be added to the collection by hitting ‘suggest’ in the above menu.", 
	creator_id: user3.id)

read = Group.create(name: "read", library_id: l1.id)
watch = Group.create(name: "watch", library_id: l1.id)
learn = Group.create(name: "learn", library_id: l1.id)
make = Group.create(name: "make", library_id: l1.id)
paris = Group.create(name: "paris", library_id: l1.id)
world = Group.create(name: "world", library_id: l1.id)

c1 = Category.create(name: "Entrepreneurship", library_id: l1.id)
c2 = Category.create(name: "Getting Started", library_id: l1.id)
c3 = Category.create(name: "Team", library_id: l1.id)
c4 = Category.create(name: "Product", library_id: l1.id)
c5 = Category.create(name: "Design", library_id: l1.id)
c6 = Category.create(name: "Marketing", library_id: l1.id)

s101 = Section.create(name: "Learn from others' stories", category_id: c1.id)
s103 = Section.create(name: "Lean Startups", category_id: c1.id)
s104 = Section.create(name: "Community & Events", category_id: c1.id)	
s105 = Section.create(name: "Libraries & Collections", category_id: c1.id)

s201 = Section.create(name: "Getting started", category_id: c2.id)
s202 = Section.create(name: "Pitching", category_id: c2.id)
s203 = Section.create(name: "Raising money", category_id: c2.id)
s205 = Section.create(name: "Legal & Accounting", category_id: c2.id)

s301 = Section.create(name: "Hiring", category_id: c3.id)
s302 = Section.create(name: "Culture", category_id: c3.id)
s303 = Section.create(name: "Communication & Collaboration", category_id: c3.id)
s304 = Section.create(name: "Personal Development", category_id: c3.id)

s401 = Section.create(name: "Product Management", category_id: c4.id)
s402 = Section.create(name: "Learn how to code", category_id: c4.id)
s403 = Section.create(name: "Build something!", category_id: c4.id)

s501 = Section.create(name: "Design Basics", category_id: c5.id)
s503 = Section.create(name: "Customer Experience", category_id: c5.id)
s504 = Section.create(name: "Typography", category_id: c5.id)
s505 = Section.create(name: "Colors, Icons & Logos", category_id: c5.id)
s506 = Section.create(name: "Photography", category_id: c5.id)
s507 = Section.create(name: "Landing Pages", category_id: c5.id)

s601 = Section.create(name: "Market Research", category_id: c6.id)
s602 = Section.create(name: "Learn about Marketing", category_id: c6.id)
s603 = Section.create(name: "Channels & Tools", category_id: c6.id)
s604 = Section.create(name: "Analytics & SEO", category_id: c6.id)
s605 = Section.create(name: "Social Media", category_id: c6.id)
s606 = Section.create(name: "Sales & Pricing", category_id: c6.id)
s607 = Section.create(name: "Content Marketing", category_id: c6.id)
s608 = Section.create(name: "Marketing Case Studies", category_id: c6.id)


e10101 = Entry.create(
	title: "Autopsy", 
	link: "http://autopsy.io/", 
	description: "Lessons from failed startups.",  
	section_id: s101.id, 
	group_id: read.id,
	accepted: true)

e10102 = Entry.create(
	title: "Journey to 500k a month - Groove Blog", 
	link: "https://www.groovehq.com/blog#timeline", 
	description: "From “aha” to “oh shit”, we’re sharing everything on our journey to $500k in monthly revenue.",  
	section_id: s101.id, 
	group_id: read.id,
	accepted: true)

e10103 = Entry.create(
	title: "39+ tips for building a startup after 15 years of success and failure", 
	link: "http://chrissaad.com/professionalblog/2015/2/39-tips-for-building-a-startup-after-15-years-of-success-and-failure", 
	description: "Blog post by Chris Saad.",  
	section_id: s101.id, 
	group_id: read.id,
	accepted: true)

e10104 = Entry.create(
	title: "Great fucking startup advice", 
	link: "http://greatfuckingstartupadvice.com/", 
	description: "A side project by Jason Shen.",  
	section_id: s101.id, 
	group_id: read.id,
	accepted: true)

e10105 = Entry.create(
	title: "Start Something: The Power of Side Projects", 
	link: "https://medium.com/busy-building-things/start-something-the-power-of-side-projects-648223f673af", 
	description: "Little Projects that have Changed the World.",  
	section_id: s101.id, 
	group_id: read.id,
	accepted: true)

e10106 = Entry.create(
	title: "From a Mailchimp email and Wufoo form to $25k in 3 months", 
	link: "https://medium.com/who-what-why/from-a-mailchimp-email-and-wufoo-form-to-25k-in-3-months-c744d79a6e76", 
	description: "Sometimes when you think up an idea you immediately picture a vision of what the final product will look like - there’s going to be a wall, chat, portfolios, and more. This can sometimes paralyze you from starting because the task seems so daunting, you begin to think that you’ll need to hire more people or raise funding to get this done.",  
	section_id: s101.id, 
	group_id: read.id,
	accepted: true)

e10107 = Entry.create(
	title: "Idea to Paying Customers in 7 Weeks: How We Did It", 
	link: "https://blog.bufferapp.com/idea-to-paying-customers-in-7-weeks-how-we-did-it", 
	description: "Joel Gascoigne shares the story of how he started Buffer.",  
	section_id: s101.id, 
	group_id: read.id,
	accepted: true)

e10108 = Entry.create(
	title: "Executing Your Idea Starts With a Small Single Step", 
	link: "http://99u.com/videos/19396/joe-gebbia-executing-your-idea-starts-with-a-small-single-step", 
	description: "Entrepreneur Job Gebbia, shares how his team grew their idea, Airbnb, into a national startup the hard way: by staying lean, “doing things that don’t scale” like meeting users one at a time, and by taking one small step at a time.",  
	section_id: s101.id, 
	group_id: watch.id,
	accepted: true)

e10109 = Entry.create(
	title: "How We Got Our First 2,000 Users Doing Things That Don’t Scale", 
	link: "http://ryanhoover.me/post/72663537463/how-we-got-our-first-2000-users-doing-things-that", 
	description: "20 days after its public launch, Product Hunt had a community of 2,000 users that they acquired by doing things that don’t scale. Here’s how they did it.",  
	section_id: s101.id, 
	group_id: read.id,
	accepted: true)


e10301 = Entry.create(
	title: "How to successfully validate your idea with a Landing Page MVP", 
	link: "https://medium.com/@joelgascoigne/how-to-successfully-validate-your-idea-with-a-landing-page-mvp-ef3c2d02dc51", 
	description: "Anything can be your Minimum Viable Product, so long as you’re truly focused on validated learning.",  
	section_id: s103.id, 
	group_id: read.id,
	accepted: true)

e10302 = Entry.create(
	title: "How I hacked together an MVP that got an immediate funding offer", 
	link: "https://www.linkedin.com/pulse/how-i-hacked-together-mvp-got-immediate-funding-offer-jon-m-bishop?trk=hp-feed-article-title", 
	description: "An article by Jon M Bishop, Chief Marketing Officer at PlusGuidance.",  
	section_id: s103.id, 
	group_id: read.id,
	accepted: true)

e10303 = Entry.create(
	title: "StartitUp", 
	link: "http://startitup.co/", 
	description: "A comprehensive actionable guide for getting your business off the ground - super valuable insights for every (potential) founder.",  
	section_id: s103.id, 
	group_id: read.id,
	accepted: true)

e10304 = Entry.create(
	title: "The Lean Startup", 
	link: "http://theleanstartup.com/", 
	description: "The movement that is transforming how new products are built and launched.",  
	section_id: s103.id, 
	group_id: learn.id,
	accepted: true)

e10305 = Entry.create(
	title: "Lean Startup Case Study - Dropbox", 
	link: "https://www.youtube.com/watch?v=y9hg-mUx8sE", 
	description: "The co-founder & CEO of Dropbox shares his story.",  
	section_id: s103.id, 
	group_id: watch.id,
	accepted: true)

e10306 = Entry.create(
	title: "How to Build a Startup - Udacity", 
	link: "https://www.udacity.com/course/how-to-build-a-startup--ep245", 
	description: "In an introduction to the basics of the famous Customer Development Process, Steve Blank provides insight into the key steps needed to build a successful startup.",  
	section_id: s103.id, 
	group_id: learn.id,
	accepted: true)

e10307 = Entry.create(
	title: "Product Hunt Began as an Email List", 
	link: "http://ryanhoover.me/post/69599262875/product-hunt-began-as-an-email-list", 
	description: "Ryan Hoover, the founder of Product Hunt, shares his story of the lean approach and mentality he used to birth Product Hunt and its ongoing development.",  
	section_id: s103.id, 
	group_id: read.id,
	accepted: true)

e10308 = Entry.create(
	title: "How to Structure Good Hypotheses for Your Lean Startup", 
	link: "http://www.instigatorblog.com/good-hypotheses/2011/05/05/", 
	description: "Crafting good hypotheses for your startup is hard. This short post by Ben Yoskovitz will help you.",  
	section_id: s103.id, 
	group_id: read.id,
	accepted: true)

e10309 = Entry.create(
	title: "Minimum Viable Product", 
	link: "https://www.youtube.com/watch?v=E4ex0fejo8w", 
	description: "Presentation for the inaugural Lean Startup Meetup in San Francisco by Eric Ries.",  
	section_id: s103.id, 
	group_id: watch.id,
	accepted: true)

e10310 = Entry.create(
	title: "What happens to user experience in a minimum viable product?", 
	link: "https://medium.com/@rjs/what-happens-to-user-experience-in-a-minimum-viable-product-5917f88079a1?s=9-what-happens-to-user-experience-in-a-minimum-viable-product", 
	description: "Does building an MVP with minimal effort come with bad user experience? It should not, argues Ryan Singer in this article.",  
	section_id: s103.id, 
	group_id: read.id,
	accepted: true)


e10401 = Entry.create(
	title: "My startup in Paris", 
	link: "http://mystartup.paris.fr/", 
	description: "Community of 3,000 Parisian startups and 36 incubators.",  
	section_id: s104.id, 
	group_id: paris.id,
	accepted: true)

e10402 = Entry.create(
	title: "#FrenchStartupsIO", 
	link: "http://frenchstartups.io/", 
	description: "French Slack community for founders, developpers and growth hackers around networking, advice, and beta testing.",  
	section_id: s104.id, 
	group_id: paris.id,
	accepted: true)

e10403 = Entry.create(
	title: "HEC Incubator", 
	link: "http://www.hec.fr/incubateur-hec/", 
	description: "The HEC Paris incubator.",  
	section_id: s104.id, 
	group_id: paris.id,
	accepted: true)

e10404 = Entry.create(
	title: "The Family", 
	link: "http://www.thefamily.co/#welcome", 
	description: "The Family nurtures entrepreneurs through education, unfair advantages, and capital.",  
	section_id: s104.id, 
	group_id: paris.id,
	accepted: true)

e10405 = Entry.create(
	title: "AngelList", 
	link: "https://angel.co/", 
	description: "The online reference where you can find & post job offers, see who's trending, and get funding for your startup.",  
	section_id: s104.id, 
	group_id: world.id,
	accepted: true)

e10406 = Entry.create(
	title: "Product Hunt", 
	link: "http://www.producthunt.com/", 
	description: "Curation of the best new products, every day.",  
	section_id: s104.id, 
	group_id: world.id,
	accepted: true)

e10407 = Entry.create(
	title: "Beta List", 
	link: "http://betalist.com/", 
	description: "Discover tomorrow's startups, today.",  
	section_id: s104.id, 
	group_id: world.id,
	accepted: true)

e10408 = Entry.create(
	title: "Launching Next", 
	link: "http://launchingnext.com/", 
	description: "The world's most promising startups.",  
	section_id: s104.id, 
	group_id: world.id,
	accepted: true)


e10501 = Entry.create(
	title: "How to start a startup", 
	link: "http://startupclass.samaltman.com/", 
	description: "How to Start a Startup is a series of video lectures, initially given at Stanford in Fall 2014. Very highly recommended.",  
	section_id: s105.id, 
	group_id: watch.id,
	accepted: true)

e10502 = Entry.create(
	title: "Google Ventures Library", 
	link: "http://www.gv.com/library/", 
	description: "The official GV library that covers a large range of topics.",  
	section_id: s105.id, 
	group_id: read.id,
	accepted: true)

e10503 = Entry.create(
	title: "Y Combinator Library", 
	link: "http://www.ycombinator.com/resources/", 
	description: "Very insightful collection of content curated by Y Combinator.",  
	section_id: s105.id, 
	group_id: read.id,
	accepted: true)

e10504 = Entry.create(
	title: "MaRS Library", 
	link: "http://www.marsdd.com/mars-library/", 
	description: "The MaRS Library contains articles, templates, reports, workbooks, reference guides and videos covering a range of topics, including accounting, funding, governance, intellectual property, leadership, legal issues, marketing, product management, selling, social innovation, strategy and talent.",  
	section_id: s105.id, 
	group_id: read.id,
	accepted: true)

e10505 = Entry.create(
	title: "Startup weekend resources", 
	link: "http://startupweekend.org/resources/", 
	description: "Database of some of the best resources on the internet around startups.",  
	section_id: s105.id, 
	group_id: read.id,
	accepted: true)

e10506 = Entry.create(
	title: "Startup Stash", 
	link: "http://startupstash.com/", 
	description: "A curated directory of resources & tools to help you build your Startup.",  
	section_id: s105.id, 
	group_id: make.id,
	accepted: true)

e10507 = Entry.create(
	title: "Freebie Supply", 
	link: "http://growth.supply/free/", 
	description: "+400 Awesome Free Tools To Build Your Business.",  
	section_id: s105.id, 
	group_id: make.id,
	accepted: true)

e10508 = Entry.create(
	title: "HandsOn TV", 
	link: "http://handson.tv/", 
	description: "Collection of startup-related videos",  
	section_id: s105.id, 
	group_id: watch.id,
	accepted: true)

e10509 = Entry.create(
	title: "'50 books that transformed my business and my life' by Joel Gascoigne", 
	link: "http://joel.is/50-books-that-transformed-my-business-and-my-life/", 
	description: "Joel Gascoigne is co-founder and CEO at Buffer.",  
	section_id: s105.id, 
	group_id: read.id,
	accepted: true)

e10510 = Entry.create(
	title: "'Startup Talks", 
	link: "http://startuptalks.tv/", 
	description: "A curated collection of startup related videos.",  
	section_id: s105.id, 
	group_id: watch.id,
	accepted: true)

e10511 = Entry.create(
	title: "'Le Wagon YouTube Channel", 
	link: "https://www.youtube.com/channel/UChCDYcBCrb8tuPAO6e0P-Hw/featured", 
	description: "Workshops, AperoTalks, Demodays videos.",  
	section_id: s105.id, 
	group_id: watch.id,
	accepted: true)



e20101 = Entry.create(
	title: "How to start a startup - Lecture 1 - Get started Pt. 1", 
	link: "https://www.youtube.com/watch?v=CBYhVcO4WgI", 
	description: "Sam Altman, President of Y Combinator, and Dustin Moskovitz, Cofounder of Facebook, Asana, and Good Ventures, kick off the How to Start a Startup Course. Sam covers the first 2 of the 4 Key Areas: Ideas, Products, Teams and Execution; and Dustin discusses Why to Start a Startup.",  
	section_id: s201.id, 
	group_id: watch.id,
	accepted: true)

e20102 = Entry.create(
	title: "How to start a startup - Lecture 2 - Get started Pt. 2", 
	link: "https://www.youtube.com/watch?v=CVfnkM44Urs", 
	description: "Sam Altman finishes up 'Ideas, Products, Teams and Execution' by covering Team and Execution, in Lecture 2 of How to Start a Startup.",  
	section_id: s201.id, 
	group_id: watch.id,
	accepted: true)

e20103 = Entry.create(
	title: "How to start a startup - Lecture 3 - Before the Startup", 
	link: "https://www.youtube.com/watch?v=ii1jcLg-eIQ", 
	description: "Paul Graham delivers an informative (and highly amusing) talk, addressing counterintuitive parts of startups, in Lecture 3 of How to Start a Startup.",  
	section_id: s201.id, 
	group_id: watch.id,
	accepted: true)

e20104 = Entry.create(
	title: "How to start a startup - Lecture 4 - Building Product, Talking to Users, and Growing", 
	link: "https://www.youtube.com/watch?v=yP176MBG9Tk", 
	description: "So you have an idea. How do you go from zero users to many users?Adora Cheung, Founder of Homejoy, covers Building Product, Talking to Users, and Growing, in Lecture 4 of How to Start a Startup.",  
	section_id: s201.id, 
	group_id: watch.id,
	accepted: true)

e20105 = Entry.create(
	title: "The Business Model Canvas Template", 
	link: "https://upload.wikimedia.org/wikipedia/commons/1/10/Business_Model_Canvas.png", 
	description: "A ready to use empty template of the Business Model Canvas by Alexander Osterwalder.",  
	section_id: s201.id, 
	group_id: make.id,
	accepted: true)

e20106 = Entry.create(
	title: "'Business Model Generation' by Alexander Osterwalder", 
	link: "http://www.businessmodelgeneration.com/book", 
	description: "Systematically understand, design & differentiate your business model with an easy-to-use and widely accepted framework.",  
	section_id: s201.id, 
	group_id: read.id,
	accepted: true)

e20107 = Entry.create(
	title: "The Humble Beginnings of a startup: AirBnB", 
	link: "http://handson.tv/video/the-humble-beginnings-of-airbnb", 
	description: "Nathan, one of 3 co-founders and CTO at Airbnb, talks about his past as an entreprenuer and the story of the creation of AirBnB.",  
	section_id: s201.id, 
	group_id: read.id,
	accepted: true)

e20108 = Entry.create(
	title: "How to start a startup - Lecture 8 - How to Get Started, Doing Things that Don't Scale, Press", 
	link: "https://www.youtube.com/watch?v=oQOC-qy-GDY", 
	description: "Stanley Tang, Founder of Doordash, covers How to Get Started. Walker Williams, Founder of Teespring, covers Doing things that Don't Scale. Justin Kan, Founder of TwitchTV and Partner at Y Combinator, covers Press.",  
	section_id: s201.id, 
	group_id: read.id,
	accepted: true)

e20109 = Entry.create(
	title: "How to get startup ideas - Paul Graham", 
	link: "http://paulgraham.com/startupideas.html", 
	description: "The way to get startup ideas is not to try to think of startup ideas. It's to look for problems, preferably problems you have yourself.",  
	section_id: s201.id, 
	group_id: read.id,
	accepted: true)

e20110 = Entry.create(
	title: "Create products that people love by validating your idea first", 
	link: "https://hitenism.com/business-ideas/", 
	description: "A three step process you can use to validate ideas.",  
	section_id: s201.id, 
	group_id: read.id,
	accepted: true)

e20111 = Entry.create(
	title: "95 Ways to find your first customers for customer development or your first sale", 
	link: "http://jasonevanish.com/2013/08/11/95-ways-to-find-your-first-customers-for-customer-development-or-your-first-sale/", 
	description: "You can have the best idea in the world, but until you find someone besides yourself that wants it, it’s not really a business.",  
	section_id: s201.id, 
	group_id: read.id,
	accepted: true)

e20112 = Entry.create(
	title: "Do things that don't scale - Paul Graham", 
	link: "http://paulgraham.com/ds.html", 
	description: "A must-read essay on getting your first users.",  
	section_id: s201.id, 
	group_id: read.id,
	accepted: true)


e20201 = Entry.create(
	title: "The Pitch Deck Template", 
	link: "https://medium.com/kima-ventures/the-pitch-deck-template-ba83d61fae66", 
	description: "A pitch deck must be both complete & short. Your goal is to turn complicated things into simple messages. This is a very basic template to get you started on your pitchdeck.",  
	section_id: s202.id, 
	group_id: read.id,
	accepted: true)

e20202 = Entry.create(
	title: "Airbnb: A $1.3 Billion-Dollar Startup's First-Ever Pitch Deck", 
	link: "http://www.businessinsider.com/airbnb-a-13-billion-dollar-startups-first-ever-pitch-deck-2011-9?op=1&IR=T", 
	description: "The founders of AirBnB shared its first pitch deck with an MBA student, back when it wanted to be an air mattress rental company. The slides have now been published and you can check them out.",  
	section_id: s202.id, 
	group_id: read.id,
	accepted: true)

e20203 = Entry.create(
	title: "BuzzFeed’s first pitch deck to investors in 2008", 
	link: "http://qz.com/389752/here-is-buzzfeeds-first-pitch-deck-to-investors-in-2008/", 
	description: "The full presentation, with some of Quartz's commentary.",  
	section_id: s202.id, 
	group_id: read.id,
	accepted: true)

e20204 = Entry.create(
	title: "'The Art of the Pitch' by Guy Kawasaki", 
	link: "https://www.linkedin.com/pulse/art-pitch-guy-kawasaki?trk=hp-feed-article-title", 
	description: "Forget “I think, therefore I am.” For entrepreneurs, the operative phrase is, “I pitch, therefore I am.” Pitching isn’t only for raising money—it’s for reaching agreement, and agreement can yield many good outcomes including sales, partnerships, and new hires. Here are the key elements of a great pitch.",  
	section_id: s202.id, 
	group_id: read.id,
	accepted: true)

e20205 = Entry.create(
	title: "Speaking.io", 
	link: "http://speaking.io/", 
	description: "A very complete and valuable series of articles on speaking, by Zach Holman from Github.",  
	section_id: s202.id, 
	group_id: read.id,
	accepted: true)

e20206 = Entry.create(
	title: "How to give more persuasive presentations: A Q&A with Nancy Duarte", 
	link: "http://blog.ted.com/how-to-give-more-persuasive-presentations-a-qa-with-nancy-duarte/", 
	description: "Presentation expert Nancy Duarte, who gave the TED Talk “The secret structure of great talks,” has built her career helping people express their ideas in presentations. Check out this short interview with her, as well as her TED talk.",  
	section_id: s202.id, 
	group_id: watch.id,
	accepted: true)

e20207 = Entry.create(
	title: "'The investor presentation we used to raise $2 million' by Crew", 
	link: "http://blog.crew.co/the-investor-presentation-we-used-to-raise-2-million/", 
	description: "The pitchdeck from Crew, a company which closed a 2 million dollar investment from a group of investors and thought it might be helpful to share their process for how we created our investor presentation.",  
	section_id: s202.id, 
	group_id: read.id,
	accepted: true)

e20208 = Entry.create(
	title: "Slides with a Purpose", 
	link: "http://emiland.me/", 
	description: "Emiland de Cubber from Capitaine Train shares his knowledge on building amazing presentations.",  
	section_id: s202.id, 
	group_id: read.id,
	accepted: true)


e20301 = Entry.create(
	title: "The Non-VC “SimCity” Approach To Growing A Media Business", 
	link: "http://blog.crew.co/the-investor-presentation-we-used-to-raise-2-million/", 
	description: "The idea of slowly building your company without relying on VC money to grow fast. A blog post by Danny Sullivan.",  
	section_id: s203.id, 
	group_id: read.id,
	accepted: true)

e20302 = Entry.create(
	title: "How to start a startup - Lecture 9 - How to Raise Money", 
	link: "https://www.youtube.com/watch?v=uFX95HahaUs", 
	description: "Sam leads a panel Q&A on Fundraising in this lecture with Marc Andreessen, Founder of Netscape and Andreessen Horowitz, Ron Conway, Founder of SV Angel, and Parker Conrad, Founder of Zenefits.",  
	section_id: s203.id, 
	group_id: read.id,
	accepted: true)

e20303 = Entry.create(
	title: "How to start a startup - Lecture 19 - Sales and Marketing; How to Talk to Investors", 
	link: "https://www.youtube.com/watch?v=SHAh6WKBgiE", 
	description: "Three segments in this lecture: 1. Tyler Bosmeny, founder and CEO of Clever, starts off today's lecture with an overview of the Sales Funnel, and how to get to your first $1 Million. 2. Michael Seibel, founder of Justin.tv and Socialcam and Partner at Y Combinator, then goes over how to talk to investors - the pitch. 3. Dalton Caldwell, founder of imeem and App.net and Partner at Y Combiantor, and Qasar Younis, founder of Talkbin and Partner at Y Combinator, then perform an investor meeting roleplay to give you a taste of how it actually might look behind the scenes.",  
	section_id: s203.id, 
	group_id: read.id,
	accepted: true)

e20304 = Entry.create(
	title: "Fund Raising is a Means Not an End", 
	link: "http://steveblank.com/2013/06/11/fund-raising-is-a-means-not-an-end/", 
	description: "For many entrepreneurs “raising money” has replaced “building a sustainable business” as their goal.  That’s a big mistake. When you take money from investors their business model becomes yours.",  
	section_id: s203.id, 
	group_id: read.id,
	accepted: true)

e20305 = Entry.create(
	title: "Do You Really Even Need VC?", 
	link: "http://www.bothsidesofthetable.com/2009/07/22/do-you-really-even-need-vc/", 
	description: "A discussion of the pro's and con's by Mark Suster, a 2x entrepreneur turned VC.",  
	section_id: s203.id, 
	group_id: read.id,
	accepted: true)

e20306 = Entry.create(
	title: "How to raise money", 
	link: "http://www.paulgraham.com/fr.html", 
	description: "An article by Paul Graham of Y Combinator.",  
	section_id: s203.id, 
	group_id: read.id,
	accepted: true)

e20307 = Entry.create(
	title: "The Anatomy of a fundable Startup", 
	link: "http://andrewchen.co/video-the-anatomy-of-a-fundable-startup-by-naval-ravikant-of-angellist/", 
	description: "An insightful talk by Naval Ravikant from AngelList.",  
	section_id: s203.id, 
	group_id: watch.id,
	accepted: true)


e20501 = Entry.create(
	title: "Jurismatic", 
	link: "http://www.jurismatic.com/", 
	description: "All legal documents for startups in France. It is open-sourced, and if you dont want to leave your email you can simply get the documents on Github.",  
	section_id: s205.id, 
	group_id: make.id,
	accepted: true)

e20502 = Entry.create(
	title: "How to start a startup - Lecture 18 - Legal and Accounting Basics for Startups", 
	link: "https://www.youtube.com/watch?v=EHzvmyMJEK4", 
	description: "There's a lot that goes behind the scenes in running a startup. Getting the legal, finance (equity allocation, vesting), accounting, and other overhead right will save you a lot of pain in the long run. Kirsty Nathoo, CFO at Y Combinator, and Carolynn Levy, General Counsel at Y Combinator, cover these very important topics in this lecture.",  
	section_id: s205.id, 
	group_id: watch.id,
	accepted: true)

e20503 = Entry.create(
	title: "Invoice To Me", 
	link: "http://invoiceto.me/", 
	description: "Free Invoice Generator.",  
	section_id: s205.id, 
	group_id: make.id,
	accepted: true)

e20504 = Entry.create(
	title: "Invoice Generator", 
	link: "https://www.free-invoice-generator.com/", 
	description: "Free Invoice Generator.",  
	section_id: s205.id, 
	group_id: make.id,
	accepted: true)

e20505 = Entry.create(
	title: "Slimvoice", 
	link: "https://slimvoice.co/", 
	description: "Free Invoice Generator.",  
	section_id: s205.id, 
	group_id: make.id,
	accepted: true)

e20506 = Entry.create(
	title: "Wave", 
	link: "https://www.waveapps.com/", 
	description: "Free & easy accounting, invoicing and more.",  
	section_id: s205.id, 
	group_id: make.id,
	accepted: true)

e20507 = Entry.create(
	title: "Invoice.to", 
	link: "https://invoice.to/", 
	description: "Free Invoice Generator.",  
	section_id: s205.id, 
	group_id: make.id,
	accepted: true)

e20508 = Entry.create(
	title: "Kiss", 
	link: "http://500.co/kiss/", 
	description: "Free legal docs for startup founders and investor.",  
	section_id: s205.id, 
	group_id: make.id,
	accepted: true)

e20509 = Entry.create(
	title: "Docracy", 
	link: "http://www.docracy.com/", 
	description: "An open collection of free legal documents.",  
	section_id: s205.id, 
	group_id: make.id,
	accepted: true)

e20510 = Entry.create(
	title: "Shake", 
	link: "http://www.shakelaw.com/", 
	description: "Create, sign and send legally binding agreements in seconds. Free for personal use.",  
	section_id: s205.id, 
	group_id: make.id,
	accepted: true)

e20511 = Entry.create(
	title: "Shopify Tools", 
	link: "https://www.shopify.com/tools", 
	description: "Everything you need to sell and grow your retail business.",  
	section_id: s205.id, 
	group_id: make.id,
	accepted: true)

e20512 = Entry.create(
	title: "Foundrs", 
	link: "http://foundrs.com/", 
	description: "An experimental co-founder equity calculator.",  
	section_id: s205.id, 
	group_id: make.id,
	accepted: true)

e20513 = Entry.create(
	title: "Startup Equity Calculator", 
	link: "http://startupequity.io/", 
	description: "Figure out how much equity to grant new hires in seconds.",  
	section_id: s205.id, 
	group_id: make.id,
	accepted: true)


e30101 = Entry.create(
	title: "Hiring by Paul English", 
	link: "http://paulenglish.com/hiring.html", 
	description: "If you are looking to build a company, your most important skill is hiring.",  
	section_id: s301.id, 
	group_id: read.id,
	accepted: true)

e30102 = Entry.create(
	title: "How to Hire Like a Start-Up", 
	link: "http://www.softwarebyrob.com/2005/09/17/how-to-hire-like-a-start-up/", 
	description: "Hiring technical people is extremely challenging, and hiring a whole slew of technical people in a short time can feel like parting the Red Sea. Rob Walling offers some guidance when you’re forced to hire like a start-up.",  
	section_id: s301.id, 
	group_id: read.id,
	accepted: true)

e30103 = Entry.create(
	title: "The Guerrilla Guide to Interviewing", 
	link: "http://www.joelonsoftware.com/articles/GuerrillaInterviewing3.html", 
	description: "Joel Spolsky writes about interviewing techies.",  
	section_id: s301.id, 
	group_id: read.id,
	accepted: true)

e30104 = Entry.create(
	title: "Hazards of Hiring", 
	link: "http://ericsink.com/bos/Hazards_of_Hiring.html", 
	description: "Four general guidelines for how to proceed with a hiring decision.",  
	section_id: s301.id, 
	group_id: read.id,
	accepted: true)


e30201 = Entry.create(
	title: "How Eventbrite built a company culture that scales, by co-founder Julia Hartz", 
	link: "http://thenextweb.com/eu/2013/05/05/how-eventbrite-built-a-company-culture-that-scales-with-co-founder-julia-hartz-video/", 
	description: "If you’re building a company, the story of how Eventbrite grew from three co-founders in 2006 to hundreds of employees (or ‘Britelings’) today is well worth hearing.",  
	section_id: s302.id, 
	group_id: watch.id,
	accepted: true)

e30202 = Entry.create(
	title: "How to start a startup - Lecture 10 - Culture", 
	link: "https://www.youtube.com/watch?v=RfWgVWGEuGE", 
	description: "Brian Chesky, Founder of Airbnb, and Alfred Lin, Former COO of Zappos and Partner at Sequoia Capital discuss how to build a great company culture.",  
	section_id: s302.id, 
	group_id: watch.id,
	accepted: true)

e30203 = Entry.create(
	title: "How to start a startup - Lecture 11 - Culture, Pt. 2", 
	link: "https://www.youtube.com/watch?v=RfWgVWGEuGE", 
	description: "Stripe and Pinterest - two companies well known for their strong cultures. The founders - John Collison, Patrick Collison, and Ben Silberman - take Q&A from Sam in part 2 of Hiring and Culture.",  
	section_id: s302.id, 
	group_id: watch.id,
	accepted: true)

e30204 = Entry.create(
	title: "A Reference Guide on Netflix's Freedom & Responsibility Culture", 
	link: "https://www.youtube.com/watch?v=RfWgVWGEuGE", 
	description: "One reason for Netflix's ongoing success is the company's culture, which emphasizes performance, freedom, and responsibility. Netflix's CEO Reed Hastings describes this culture in detail in this excellent presentation.",  
	section_id: s302.id, 
	group_id: watch.id,
	accepted: true)

e30205 = Entry.create(
	title: "Valve Handbook for new employees", 
	link: "http://www.valvesoftware.com/company/Valve_Handbook_LowRes.pdf", 
	description: "Valve's culture in one document - check out a critical discussion of it here: http://www.wired.com/2013/07/wireduk-valve-jeri-ellsworth/.",  
	section_id: s302.id, 
	group_id: read.id,
	accepted: true)

e30206 = Entry.create(
	title: "AngelList - Doing the wrong things the right way", 
	link: "http://www.slideshare.net/fcosaez/joshua-slayton", 
	description: "Culture at AngelList.",  
	section_id: s302.id, 
	group_id: read.id,
	accepted: true)

e30207 = Entry.create(
	title: "Engineering Management", 
	link: "http://algeri-wong.com/yishan/engineering-management.html", 
	description: "How to manage engineers. This is Yishan Wong writing about his own experiences as manager and director of engineering with Facebook, during the time the company went from less than 10M users in 2006 to 250M users in 2009.",  
	section_id: s302.id, 
	group_id: read.id,
	accepted: true)


e30301 = Entry.create(
	title: "Slack", 
	link: "https://slack.com/", 
	description: "Imagine all your team communication in one place, instantly searchable, available wherever you go. That's Slack. We’re on a mission to make your working life simpler, more pleasant and more productive.",  
	section_id: s303.id, 
	group_id: make.id,
	accepted: true)

e30302 = Entry.create(
	title: "Skype", 
	link: "http://www.skype.com/en/", 
	description: "Skype keeps the world talking. Call, message and share whatever you want for free. Transform the way you work - Enjoy collaborating with your colleagues over Skype.",  
	section_id: s303.id, 
	group_id: make.id,
	accepted: true)

e30303 = Entry.create(
	title: "Appear In", 
	link: "https://appear.in/", 
	description: "Video conversations with up to 8 people for free. No login required, no installs, and the possibility of screen-sharing.",  
	section_id: s303.id, 
	group_id: make.id,
	accepted: true)

e30304 = Entry.create(
	title: "Google Docs", 
	link: "https://www.google.com/docs/about/", 
	description: "Create and edit web-based documents, spreadsheets, and presentations. Store documents online and access them from any computer.",  
	section_id: s303.id, 
	group_id: make.id,
	accepted: true)

e30305 = Entry.create(
	title: "Dropbox", 
	link: "https://www.dropbox.com/", 
	description: "Store, synchronize and share files online with public access. Everything you keep in Dropbox is synced automatically to all your devices.",  
	section_id: s303.id, 
	group_id: read.id,
	accepted: true)

e30306 = Entry.create(
	title: "WeTransfer", 
	link: "https://www.wetransfer.com/", 
	description: "Send up to 2GB of files to any email adress, no install required and free.",  
	section_id: s303.id, 
	group_id: make.id,
	accepted: true)

e30307 = Entry.create(
	title: "Evernote", 
	link: "https://evernote.com/", 
	description: "Evernote is the place to collect inspirational ideas, write meaningful words, and move your important projects forward.",  
	section_id: s303.id, 
	group_id: make.id,
	accepted: true)

e30308 = Entry.create(
	title: "Trello", 
	link: "https://trello.com/", 
	description: "Trello is an awesome project management tool that makes collaboration easy and, dare I say, even fun.",  
	section_id: s303.id, 
	group_id: make.id,
	accepted: true)

e30309 = Entry.create(
	title: "Asana", 
	link: "https://asana.com/", 
	description: "Asana is a web and mobile application designed to enable teamwork without email.",  
	section_id: s303.id, 
	group_id: make.id,
	accepted: true)

e30310 = Entry.create(
	title: "IFTTT", 
	link: "https://ifttt.com/", 
	description: "IFTTT puts the internet to work for you. Create simple connections between the products you use every day.",  
	section_id: s303.id, 
	group_id: make.id,
	accepted: true)

e30311 = Entry.create(
	title: "Sunrise Calendar", 
	link: "https://calendar.sunrise.am/", 
	description: "Sunrise is a free calendar app made for Google Calendar, iCloud and Exchange. Available on Desktop, iPhone, iPad and Android.",  
	section_id: s303.id, 
	group_id: make.id,
	accepted: true)

e30312 = Entry.create(
	title: "How to start a startup - Lecture 15 - How to Manage", 
	link: "https://www.youtube.com/watch?v=uVhTvQXfibU", 
	description: "You are not the only one whom your decisions impact. Ben Horowitz, founder of Andreessen Horowitz and Opsware, discusses this important management perspective that founders miss, with, of course, the gratuitous rap lyric or two sprinkled in.",  
	section_id: s303.id, 
	group_id: watch.id,
	accepted: true)

e30313 = Entry.create(
	title: "Skitch by Evernote", 
	link: "https://evernote.com/skitch/", 
	description: "Get your point across with fewer words using annotation, shapes and sketches, so that your ideas become reality faster.",  
	section_id: s303.id, 
	group_id: make.id,
	accepted: true)

e30314 = Entry.create(
	title: "A5", 
	link: "http://a5.gg/", 
	description: "Minimalistic notes app.",  
	section_id: s303.id, 
	group_id: make.id,
	accepted: true)

e30315 = Entry.create(
	title: "Tally", 
	link: "http://tally.tl/", 
	description: "Create polls in no time.",  
	section_id: s303.id, 
	group_id: make.id,
	accepted: true)

e30316 = Entry.create(
	title: "Doodle", 
	link: "http://doodle.com/", 
	description: "Doodle simplifies scheduling - a lot.",  
	section_id: s303.id, 
	group_id: make.id,
	accepted: true)


e30401 = Entry.create(
	title: "A guide to networking for new entrepreneurs and early-stage startups", 
	link: "http://tech.eu/features/4376/networking-early-stage-startups-entrepreneurs/", 
	description: "Are you a budding entrepreneur looking for tips to up your networking game? Here, tech.eu asked experts to share some advice on how to approach networking for early-stage startups.",  
	section_id: s304.id, 
	group_id: read.id,
	accepted: true)

e30402 = Entry.create(
	title: "How to start a startup - Lecture 13 - How to be a Great Founder", 
	link: "https://www.youtube.com/watch?v=dQ7ZvO5DpIw", 
	description: "So you've learned how to get started, how to raise money, how to build products, and how to grow. Reid Hoffman, founder of LinkedIn and Partner at Greylock Ventures, addresses many of the questions and confusions that might be cropping up - How to be a Great Founder.",  
	section_id: s304.id, 
	group_id: watch.id,
	accepted: true)

e30403 = Entry.create(
	title: "How to start a startup - Lecture 14 - How to Operate", 
	link: "https://www.youtube.com/watch?v=6fQHLK1aIBs", 
	description: "What should the CEO be doing on a day to day basis? How do you make sure the company is moving in the right direction? Keith Rabois, Partner at Khosla Ventures and former COO of Square, tackles the nitty gritty - How to Operate. Lots of actionable takeaways from this lecture!",  
	section_id: s304.id, 
	group_id: watch.id,
	accepted: true)

e30404 = Entry.create(
	title: "How to start a startup - Lecture 20 - Later-stage Advice", 
	link: "https://www.youtube.com/watch?v=59ZQ-rf6iIc", 
	description: "Sam caps off the How to Start a Startup series with things you should ignore when you start, but become important a year in.",  
	section_id: s304.id, 
	group_id: watch.id,
	accepted: true)

e30405 = Entry.create(
	title: "Egg Timer", 
	link: "http://e.ggtimer.com/", 
	description: "A simple countdown timer.",  
	section_id: s304.id, 
	group_id: make.id,
	accepted: true)

e30406 = Entry.create(
	title: "There are no rules", 
	link: "http://us6.campaign-archive1.com/?u=26857d08cfc91db6993e0bfc4&id=018282c69a", 
	description: "There are no rules in business or entrepreneurship. Anyone that tells you otherwise is either lying, has no idea what they’re talking about, or is just about to pitch you their 'How to succeed in business' e-course.",  
	section_id: s304.id, 
	group_id: read.id,
	accepted: true)

e30407 = Entry.create(
	title: "Hiring is obsolete", 
	link: "http://www.paulgraham.com/hiring.html", 
	description: "The less it costs to start a company, the less you need the permission of investors to do it. So a lot of people will be able to start companies now who never could have before.",  
	section_id: s304.id, 
	group_id: read.id,
	accepted: true)

e30408 = Entry.create(
	title: "Thinking, Fast and Slow by Daniel Kahneman", 
	link: "http://www.amazon.com/Thinking-Fast-Slow-Daniel-Kahneman/dp/0374533555", 
	description: "Engaging the reader in a lively conversation about how we think, Kahneman reveals where we can and cannot trust our intuitions and how we can tap into the benefits of slow thinking. He offers practical and enlightening insights into how choices are made in both our business and our personal lives--and how we can use different techniques to guard against the mental glitches that often get us into trouble.",  
	section_id: s304.id, 
	group_id: read.id,
	accepted: true)



e40101 = Entry.create(
	title: "How to start a startup - Lecture 7 - How to Build Products Users Love", 
	link: "https://www.youtube.com/watch?v=sz_LgBAGYyo", 
	description: "Kevin Hale, Founder of Wufoo and Partner at Y Combinator, explains how to build products that create a passionate user base invested in your startup's success.",  
	section_id: s401.id, 
	group_id: watch.id,
	accepted: true)

e40102 = Entry.create(
	title: "How to start a startup - Lecture 12 - Building for the Enterprise", 
	link: "https://www.youtube.com/watch?v=sz_LgBAGYyo", 
	description: "Aaron Levie - founder of Box, enterprise master, Twitter comedic genius. In this lecture, he'll convince you to Build for the Enterprise.",  
	section_id: s401.id, 
	group_id: watch.id,
	accepted: true)

e40103 = Entry.create(
	title: "How to start a startup - Lecture 17 - How to Design Hardware Products", 
	link: "https://www.youtube.com/watch?v=F4K_qVlYQkg", 
	description: "Hosain Rahman, CEO and Founder of Jawbone, covers the design process for building hardware products users love.",  
	section_id: s401.id, 
	group_id: watch.id,
	accepted: true)

e40104 = Entry.create(
	title: "Managing Product Development by Integrating Around Concerns", 
	link: "https://medium.com/@rjs/managing-product-development-by-integrating-around-concerns-77640bcde28d?s=16-managing-product-development-by-integrating-around-concerns", 
	description: "A structured approach to designing and developing a product.",  
	section_id: s401.id, 
	group_id: read.id,
	accepted: true)

e40105 = Entry.create(
	title: "Set Your Priorities", 
	link: "http://www.joelonsoftware.com/articles/SetYourPriorities.html", 
	description: "How to prioritize the long list of features you came up with for your product.",  
	section_id: s401.id, 
	group_id: read.id,
	accepted: true)


e40201 = Entry.create(
	title: "Paul Ford: What is Code?", 
	link: "http://www.bloomberg.com/graphics/2015-paul-ford-what-is-code/", 
	description: "A single story devoted to demystifying code and the culture of the people who make it. There’s some technical language along with a few pretty basic mathematical concepts. There are also lots of solid jokes and lasting insights. It may take a few hours to read, but that’s a small price to pay for adding decades to your career.",  
	section_id: s402.id, 
	group_id: read.id,
	accepted: true)

e40202 = Entry.create(
	title: "Smashing Magazine", 
	link: "http://www.smashingmagazine.com/", 
	description: "Smashing Magazine",  
	section_id: s402.id, 
	group_id: read.id,
	accepted: true)

e40203 = Entry.create(
	title: "'Identifying The Long Tail' by Chris Anderson", 
	link: "https://www.youtube.com/watch?v=0Yku0GTrcuw", 
	description: "'Wired' editor and author Chris Anderson explains his theory of 'The Long Tail', using the music and film industries as examples.",  
	section_id: s402.id, 
	group_id: watch.id,
	accepted: true)

e40204 = Entry.create(
	title: "Coder's Guide", 
	link: "https://www.youtube.com/user/CodersGuide", 
	description: "YouTube channel with videos centered around computer programming, in areas such as HTML web development, cross-platform Java programming, beginner .net programming with Visual Basic and client sided JavaScript web development.",  
	section_id: s402.id, 
	group_id: watch.id,
	accepted: true)

e40205 = Entry.create(
	title: "Codeacademy", 
	link: "https://www.codecademy.com", 
	description: "Interactive courses on how to program. Courses are created by community and cover HTML, CSS, Java, jQuery, and many more.",  
	section_id: s402.id, 
	group_id: learn.id,
	accepted: true)

e40206 = Entry.create(
	title: "Code Workshop by Le Wagon", 
	link: "http://workshops.lewagon.org/workshops/landing/index.html#/", 
	description: "Overview of the basic technologies & programming languages that are useful for entrepreneurs.",  
	section_id: s402.id, 
	group_id: learn.id,
	accepted: true)

e40207 = Entry.create(
	title: "Intro to HTML and CSS by Udacity", 
	link: "https://www.udacity.com/course/intro-to-html-and-css--ud304", 
	description: "In this course you will learn how to convert digital design mockups into static web pages. It will teach you how to approach page layout, how to break down a design mockup into page elements, and how to implement that in HTML and CSS.",  
	section_id: s402.id, 
	group_id: learn.id,
	accepted: true)

e40208 = Entry.create(
	title: "CSS Tutorial by w3schools", 
	link: "http://www.w3schools.com/css/", 
	description: "In this CSS tutorial you will learn how to use CSS to control the style and layout of multiple Web pages all at once.",  
	section_id: s402.id, 
	group_id: learn.id,
	accepted: true)

e40209 = Entry.create(
	title: "Responsive Web Design Fundamentals by Udacity", 
	link: "https://www.udacity.com/course/responsive-web-design-fundamentals--ud893", 
	description: "In this course you'll learn the fundamentals of responsive web design with Google's Pete LePage! You'll create your own responsive web page that works well on any device - phone, tablet, desktop or anything in between.",  
	section_id: s402.id, 
	group_id: learn.id,
	accepted: true)

e40210 = Entry.create(
	title: "Responsive Design Knowledge Hub by ugurus", 
	link: "http://www.ugurus.com/responsive-design", 
	description: "Contains a wide variety of content on responsive design.",  
	section_id: s402.id, 
	group_id: learn.id,
	accepted: true)

e40211 = Entry.create(
	title: "Responsive Images by Udacity", 
	link: "https://www.udacity.com/course/responsive-images--ud882", 
	description: "In this course you will learn how to work with images on the modern web, so that your images look great and load quickly on any device.",  
	section_id: s402.id, 
	group_id: learn.id,
	accepted: true)

e40212 = Entry.create(
	title: "Mediaqueri.es", 
	link: "http://mediaqueri.es/", 
	description: "Collection of beautiful and effective responsive designs.",  
	section_id: s402.id, 
	group_id: learn.id,
	accepted: true)

e40213 = Entry.create(
	title: "JavaScript Basics by Udacity", 
	link: "https://www.udacity.com/course/javascript-basics--ud804", 
	description: "In this course, you'll explore the JavaScript programming language by creating an interactive version of your résumé. You’ll learn the JavaScript programming fundamentals you need while building new elements and sections to enhance your résumé.",  
	section_id: s402.id, 
	group_id: learn.id,
	accepted: true)

e40214 = Entry.create(
	title: "Intro to jQuery by Udacity", 
	link: "https://www.udacity.com/course/intro-to-jquery--ud245", 
	description: "jQuery is the most popular JavaScript library today, in use by over 60% of the top 100,000 most visited websites. This course will teach you how to use jQuery’s core features - DOM element selections, traversal and manipulation.",  
	section_id: s402.id, 
	group_id: learn.id,
	accepted: true)

e40215 = Entry.create(
	title: "Website Performance Optimization by Udacity", 
	link: "https://www.udacity.com/course/website-performance-optimization--ud884", 
	description: "You will learn how to optimize any website for speed by diving into the details of how mobile and desktop browsers render pages.",  
	section_id: s402.id, 
	group_id: learn.id,
	accepted: true)

e40216 = Entry.create(
	title: "Using the Google Chrome Console", 
	link: "https://developers.google.com/web/tools/javascript/console/", 
	description: "The Chrome DevTools Console panel is your focal point for direct interaction with a page in real time.",  
	section_id: s402.id, 
	group_id: learn.id,
	accepted: true)

e40217 = Entry.create(
	title: "How to Use Git and GitHub by Udacity", 
	link: "https://www.udacity.com/course/how-to-use-git-and-github--ud775", 
	description: "Effective use of version control is an important and useful skill for any developer working on long-lived (or even medium-lived) projects, especially if more than one developer is involved. This course, built with input from GitHub, will introduce the basics of using version control by focusing on a particular version control system called Git and a collaboration platform called GitHub.",  
	section_id: s402.id, 
	group_id: learn.id,
	accepted: true)

e40218 = Entry.create(
	title: "Introduction to Computer Science by Harvard University", 
	link: "https://www.edx.org/course/introduction-computer-science-harvardx-cs50x?gclid=CNeEwPiIhcQCFebHtAodZGAAmQ#.VPHwR44mGSo", 
	description: "An introduction to the intellectual enterprises of computer science and the art of programming.",  
	section_id: s402.id, 
	group_id: learn.id,
	accepted: true)

e40219 = Entry.create(
	title: "Khan Academy", 
	link: "https://www.khanacademy.org/", 
	description: "Offers a selection of free courses on programming.",  
	section_id: s402.id, 
	group_id: learn.id,
	accepted: true)

e40220 = Entry.create(
	title: "Always Learning", 
	link: "http://alwayslearning.io/", 
	description: "Collection of resources for learning programming and design.",  
	section_id: s402.id, 
	group_id: learn.id,
	accepted: true)

e40221 = Entry.create(
	title: "Google's HTML/CSS Style Guide", 
	link: "http://google.github.io/styleguide/htmlcssguide.xml", 
	description: "This document defines formatting and style rules for HTML and CSS. It aims at improving collaboration, code quality, and enabling supporting infrastructure.",  
	section_id: s402.id, 
	group_id: learn.id,
	accepted: true)

e40222 = Entry.create(
	title: "'Udacity Says It Can Teach Tech Skills to Millions, and Fast' by the New York Times", 
	link: "http://www.nytimes.com/2015/09/17/technology/udacity-says-it-can-teach-tech-skills-to-millions.html?utm_source=udacity&utm_medium=email&utm_campaign=20150921%20NY%20Times%20Jobs&_r=0", 
	description: "An interesting article on Udacity's online 'nanodegrees' programs and their career development potential.",  
	section_id: s402.id, 
	group_id: read.id,
	accepted: true)

e40223 = Entry.create(
	title: "How Mobile is Enabling Tech to Outgrow the Tech Industry", 
	link: "https://vimeo.com/110428014", 
	description: "Benedict Evans' presentation on the future of mobile (which happens also to be the future of tech). The talk was delivered at a16z's 2014 Tech Summit. (13 minutes)",  
	section_id: s402.id, 
	group_id: read.id,
	accepted: true)


e40301 = Entry.create(
	title: "Stack Overflow", 
	link: "http://stackoverflow.com/", 
	description: "A question and answer site for professional and enthusiast programmers that will answer pretty much any question that comes up while coding. It's 100% free.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40302 = Entry.create(
	title: "Bootstrap", 
	link: "http://getbootstrap.com/", 
	description: "The most popular HTML, CSS, and JS framework for developing responsive, mobile first projects on the web.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40303 = Entry.create(
	title: "jQuery", 
	link: "https://jquery.com/", 
	description: "The most popular JavaScript library in use today.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40304 = Entry.create(
	title: "Git", 
	link: "http://git-scm.com/downloads", 
	description: "Version control for your projects.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40305 = Entry.create(
	title: "Github", 
	link: "https://github.com/", 
	description: "GitHub is a Git repository hosting service, but it adds many of its own features. While Git is a command line tool, GitHub provides a Web-based graphical interface.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40306 = Entry.create(
	title: "Google Fonts", 
	link: "https://www.google.com/fonts", 
	description: "Hundreds of free, open-source fonts optimized for the web. Very easy and quick to use.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40307 = Entry.create(
	title: "Font Awesome", 
	link: "http://fortawesome.github.io/Font-Awesome/", 
	description: "The iconic font and CSS toolkit.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40308 = Entry.create(
	title: "Can I use... Support tables for HTML5, CSS3, etc.", 
	link: "http://caniuse.com/", 
	description: "Platform that allows to test usability of your code across platforms.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40309 = Entry.create(
	title: "GitHub Pages", 
	link: "https://pages.github.com/", 
	description: "Websites for you and your projects. Hosted directly from your GitHub repository. Just edit, push, and your changes are live",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40310 = Entry.create(
	title: "CSS Snippets by css-tricks", 
	link: "https://css-tricks.com/snippets/css/", 
	description: "Useful snippets that can be used for your projects.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40311 = Entry.create(
	title: "Character Entities Cheat Sheet for HTML, CSS & Javascript", 
	link: "http://brajeshwar.github.io/entities/", 
	description: "Character Entities for HTML, CSS (content) and Javascript.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40312 = Entry.create(
	title: "Responsive Web Design Cheat Sheet", 
	link: "https://uxpin.s3.amazonaws.com/responsive_web_design_cheatsheet.pdf", 
	description: "Contains break points in px for all devices, all on one sheet.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40313 = Entry.create(
	title: "HTML Ipsum", 
	link: "http://html-ipsum.com/", 
	description: "Dummy HTML snippets.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40314 = Entry.create(
	title: "HTML5 Boilerplate", 
	link: "https://html5boilerplate.com/", 
	description: "HTML5 Boilerplate helps you build fast, robust, and adaptable web apps or sites. Kick-start your project with the combined knowledge and effort of 100s of developers, all in one little package.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40315 = Entry.create(
	title: "Sublime Text 2", 
	link: "http://www.sublimetext.com/", 
	description: "Sublime Text is a sophisticated text editor for code, markup and prose. You'll love the slick user interface, extraordinary features and amazing performance.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40316 = Entry.create(
	title: "Codepen", 
	link: "http://codepen.io/", 
	description: "It is an HTML, CSS, and JavaScript code editor in your browser with instant previews of the code you see and write.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40317 = Entry.create(
	title: "Sass", 
	link: "http://sass-lang.com/", 
	description: "Sass is an extension of CSS3, adding nested rules, variables, mixins, selector inheritance, and more.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40318 = Entry.create(
	title: "Less", 
	link: "http://lesscss.org/", 
	description: "Less is a CSS pre-processor, meaning that it extends the CSS language, adding features that allow variables, mixins, functions and many other techniques.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40319 = Entry.create(
	title: "Modernizr", 
	link: "https://modernizr.com/", 
	description: "Modernizr is a JavaScript library that detects HTML5 and CSS3 features in the user’s browser.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40320 = Entry.create(
	title: "JS Fiddle", 
	link: "https://jsfiddle.net/", 
	description: "Test your JavaScript, CSS, HTML or CoffeeScript online.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40321 = Entry.create(
	title: "Bower", 
	link: "http://bower.io/", 
	description: "Web sites are made of lots of things — frameworks, libraries, assets, utilities, and rainbows. Bower manages all these things for you.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40322 = Entry.create(
	title: "Foundation", 
	link: "http://foundation.zurb.com/", 
	description: "Foundation is a responsive front-end framework in the world. You can quickly prototype and build sites or apps that work on any kind of device with Foundation.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40323 = Entry.create(
	title: "Grunt", 
	link: "http://gruntjs.com/", 
	description: "The less work you have to do when performing repetitive tasks like minification, compilation, unit testing, linting, etc, the easier your job becomes. Grunt is a task runner that helps you achieve just that.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40324 = Entry.create(
	title: "Atom", 
	link: "https://atom.io/", 
	description: "Atom is a free and open-source text and source code editor for OS X, Linux, and Windows with support for plug-ins written in Node.js, and embedded Git Control, developed by GitHub.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40325 = Entry.create(
	title: "HTML5 UP", 
	link: "http://html5up.net/", 
	description: "Responsive HTML5 and CSS3 site templates.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40326 = Entry.create(
	title: "WordPress", 
	link: "https://wordpress.com/", 
	description: "Create your new website for free. WordPress powers 24% of the internet.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40327 = Entry.create(
	title: "Strikingly", 
	link: "https://www.strikingly.com/", 
	description: "Free, unlimited mobile optimized websites for strikingly domains.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40328 = Entry.create(
	title: "Layers", 
	link: "http://www.layerswp.com/", 
	description: "A simple WordPress site builder.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40329 = Entry.create(
	title: "Bootstrap Zero", 
	link: "http://www.bootstrapzero.com/", 
	description: "The largest open-source, free Bootstrap template collection.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40330 = Entry.create(
	title: "Google Pagespeed Insights", 
	link: "https://developers.google.com/speed/pagespeed/insights/", 
	description: "Improve loading times of your page across all devices.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40331 = Entry.create(
	title: "W3C Markup Validation Service", 
	link: "https://validator.w3.org/", 
	description: "Check the markup (HTML, XHTML, …) of Web documents and correct your errors.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40332 = Entry.create(
	title: "Pingdom Website Speed Test", 
	link: "http://tools.pingdom.com/fpt/", 
	description: "Enter a URL to test the load time of that page, analyze it and find bottlenecks.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40333 = Entry.create(
	title: "GT Metrix", 
	link: "https://gtmetrix.com/", 
	description: "GTmetrix gives you insight on how well your site loads and provides actionable recommendations on how to optimize it.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40334 = Entry.create(
	title: "Bitbucket", 
	link: "https://bitbucket.org/", 
	description: "Git solution for teams. Collaborate on code with inline comments and pull requests. Manage and share your Git repositories.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40335 = Entry.create(
	title: "Pingdom", 
	link: "https://www.pingdom.com/free/", 
	description: "Don't get caught with your pants down when your site stops working. When something happens you'll receive alerts via email and SMS before your customers starts to contact you.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40336 = Entry.create(
	title: "Github Student Developer Pack", 
	link: "https://education.github.com/pack", 
	description: "The best developer tools, free for students.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40337 = Entry.create(
	title: "Hipster Business Name", 
	link: "http://www.hipsterbusiness.name/", 
	description: "Hipster business name generator.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40338 = Entry.create(
	title: "The Name App", 
	link: "http://thenameapp.com/", 
	description: "Find an available name for your brilliant idea.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40339 = Entry.create(
	title: "Lean Domain Search", 
	link: "http://www.leandomainsearch.com/", 
	description: "Find a great available domain name for your website in seconds",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)

e40340 = Entry.create(
	title: "Domainr", 
	link: "https://domainr.com/", 
	description: "Fast, free, domain name search, short URLs.",  
	section_id: s403.id, 
	group_id: make.id,
	accepted: true)



e50101 = Entry.create(
	title: "Awwwards", 
	link: "http://www.awwwards.com/", 
	description: "The awards for design, creativity and innovation on the Internet - a great source for inspiration.",  
	section_id: s501.id, 
	group_id: learn.id,
	accepted: true)

e50102 = Entry.create(
	title: "The Best Designs", 
	link: "https://www.thebestdesigns.com/", 
	description: "Featuring the best of web design. Filter by style or search designs by color, industry or genre.",  
	section_id: s501.id, 
	group_id: learn.id,
	accepted: true)

e50103 = Entry.create(
	title: "CSS Design Awards", 
	link: "http://www.cssdesignawards.com/", 
	description: "Premium website awards, endless inspiration and curated resources for web designers & developers.",  
	section_id: s501.id, 
	group_id: learn.id,
	accepted: true)

e50104 = Entry.create(
	title: "Marissa Mayer's New Rule For App Design", 
	link: "http://uk.businessinsider.com/marissa-mayers-new-rule-for-app-design-2015-1?r=US", 
	description: "Yahoo's Marissa Mayer and her 'two tap' rule for mobile app design.",  
	section_id: s501.id, 
	group_id: read.id,
	accepted: true)

e50105 = Entry.create(
	title: "Desinion", 
	link: "http://desinion.com/", 
	description: "A place to give and get opinions on design.",  
	section_id: s501.id, 
	group_id: make.id,
	accepted: true)

e50106 = Entry.create(
	title: "On visual design", 
	link: "https://medium.com/@amarkdalen/on-visual-design-252a7e7f4895", 
	description: "Andreas Markdalen in an engaging talk about the state of visual design.",  
	section_id: s501.id, 
	group_id: watch.id,
	accepted: true)

e50107 = Entry.create(
	title: "Sites we like", 
	link: "http://www.designmadeingermany.de/sites-we-like/", 
	description: "Curated collection of websites for inspiration.",  
	section_id: s501.id, 
	group_id: learn.id,
	accepted: true)

e50108 = Entry.create(
	title: "Dribbble", 
	link: "https://dribbble.com/", 
	description: "Dribbble is show and tell for designers.",  
	section_id: s501.id, 
	group_id: learn.id,
	accepted: true)

e50109 = Entry.create(
	title: "Dois-je utiliser... [FR]", 
	link: "http://www.doisjeutiliser.fr/", 
	description: "Should you use elements like carousels or an infinite scroll in your project? 'Dois-je utiliser' provides you with vsual clues on why it might or might not be a good idea.",  
	section_id: s501.id, 
	group_id: learn.id,
	accepted: true)

e50110 = Entry.create(
	title: "Design Research Techniques", 
	link: "http://designresearchtechniques.com/#/", 
	description: "Provides a very detailed overview of existing design research techniques for all states of your project.",  
	section_id: s501.id, 
	group_id: learn.id,
	accepted: true)

e50111 = Entry.create(
	title: "Ink", 
	link: "http://market.designmodo.com/ink/", 
	description: "Ink contains more than 120 elaborate iOS 8 screens in 7 categories that will meet any needs you have in the design process.",  
	section_id: s501.id, 
	group_id: learn.id,
	accepted: true)

e50112 = Entry.create(
	title: "'10 Principles Of Effective Web Design' by Smashing Magazine", 
	link: "http://www.smashingmagazine.com/2008/01/10-principles-of-effective-web-design/", 
	description: "In order to use the principles properly we first need to understand how users interact with web-sites, how they think and what are the basic patterns of users’ behavior.",  
	section_id: s501.id, 
	group_id: learn.id,
	accepted: true)

e50113 = Entry.create(
	title: "Dunnnk", 
	link: "http://dunnnk.com/", 
	description: "Powerful online tool to create beautiful mockups of your website or app.",  
	section_id: s501.id, 
	group_id: make.id,
	accepted: true)

e50114 = Entry.create(
	title: "Placeit", 
	link: "https://placeit.net/", 
	description: "Free product mockups & templates.",  
	section_id: s501.id, 
	group_id: make.id,
	accepted: true)

e50115 = Entry.create(
	title: "Canva", 
	link: "https://www.canva.com/", 
	description: "Amazingly simple graphic design.",  
	section_id: s501.id, 
	group_id: make.id,
	accepted: true)

e50116 = Entry.create(
	title: "DBFreebies", 
	link: "http://dbfreebies.co/", 
	description: "Dribbble & Behance best design freebies.",  
	section_id: s501.id, 
	group_id: read.id,
	accepted: true)

e50117 = Entry.create(
	title: "Marvel", 
	link: "https://marvelapp.com/", 
	description: "Free mobile and web prototyping for everyone.",  
	section_id: s501.id, 
	group_id: make.id,
	accepted: true)

e50118 = Entry.create(
	title: "iOS 8 GUI PSD (iPhone 6)", 
	link: "http://www.teehanlax.com/tools/iphone/", 
	description: "A Photoshop template of GUI elements found in the public release of iOS 8.",  
	section_id: s501.id, 
	group_id: make.id,
	accepted: true)

e50119 = Entry.create(
	title: "iPad GUI PSD", 
	link: "http://www.teehanlax.com/tools/ipad/", 
	description: "This Photoshop template contains all the major iOS elements to help you design your app.",  
	section_id: s501.id, 
	group_id: make.id,
	accepted: true)

e50120 = Entry.create(
	title: "Tethr", 
	link: "http://www.invisionapp.com/tethr", 
	description: "We're talking $80 worth of Photoshop and Sketch templates. Totally free.",  
	section_id: s501.id, 
	group_id: make.id,
	accepted: true)

e50121 = Entry.create(
	title: "Freebies by Placeit", 
	link: "http://freebies.placeit.net/", 
	description: "Freebies curated by Placeit, delivered right to your Dropbox.",  
	section_id: s501.id, 
	group_id: read.id,
	accepted: true)

e50122 = Entry.create(
	title: "Site Inspire", 
	link: "http://www.siteinspire.com/", 
	description: "Web design inspiration.",  
	section_id: s501.id, 
	group_id: read.id,
	accepted: true)

e50123 = Entry.create(
	title: "Land Book", 
	link: "http://land-book.com/", 
	description: "Product landing pages gallery.",  
	section_id: s501.id, 
	group_id: read.id,
	accepted: true)

e50124 = Entry.create(
	title: "Pttrns", 
	link: "http://pttrns.com/", 
	description: "Mobile user interface patterns.",  
	section_id: s501.id, 
	group_id: read.id,
	accepted: true)

e50125 = Entry.create(
	title: "One Page Love", 
	link: "https://onepagelove.com/", 
	description: "Resource for one page website inspiration.",  
	section_id: s501.id, 
	group_id: read.id,
	accepted: true)

e50126 = Entry.create(
	title: "UI Parade", 
	link: "http://www.uiparade.com/", 
	description: "User interface design tools and design inspiration.",  
	section_id: s501.id, 
	group_id: read.id,
	accepted: true)

e50127 = Entry.create(
	title: "Niice", 
	link: "https://niice.co/", 
	description: "A search engine with taste.",  
	section_id: s501.id, 
	group_id: read.id,
	accepted: true)

e50128 = Entry.create(
	title: "Design for Hackers: Reverse Engineering Beauty", 
	link: "http://www.amazon.com/Design-Hackers-Reverse-Engineering-Beauty/dp/1119998956", 
	description: "You'll learn about color theory, typography, proportions, and design principles. This theoretical advice is mixed with concrete, actionable advice.",  
	section_id: s501.id, 
	group_id: read.id,
	accepted: true)


e50301 = Entry.create(
	title: "The 5 laws of Interface Design", 
	link: "https://courses.platzi.com/courses/laws-of-interface-design/", 
	description: "Y Combinator's Kevin Hale teaches the 5 laws every software designer should know about interface design. He'll walk you through the experiments used to discover them and visualize the math in ways that makes it easy to see how to apply them in your day to day design work.",  
	section_id: s503.id, 
	group_id: learn.id,
	accepted: true)

e50302 = Entry.create(
	title: "User Experience for the Web (WebUX) by open2study", 
	link: "https://www.open2study.com/courses/user-experience-for-the-web", 
	description: "Learn to create great experiences for people visiting websites, with proven tools and techniques.",  
	section_id: s503.id, 
	group_id: learn.id,
	accepted: true)

e50303 = Entry.create(
	title: "UX Project Checklist", 
	link: "http://uxchecklist.github.io/", 
	description: "Amazing overview of every step in UX design for your project in the form of a checklist.",  
	section_id: s503.id, 
	group_id: make.id,
	accepted: true)

e50304 = Entry.create(
	title: "Good UI", 
	link: "http://goodui.org/", 
	description: "A curated and beautifully designed running idea list of what makes user interfaces good.",  
	section_id: s503.id, 
	group_id: read.id,
	accepted: true)

e50305 = Entry.create(
	title: "UX Design Weekly", 
	link: "http://uxdesignweekly.com/", 
	description: "A weekly mailing list of UX design links curated by Kenny Chen.",  
	section_id: s503.id, 
	group_id: read.id,
	accepted: true)

e50306 = Entry.create(
	title: "Origami", 
	link: "https://facebook.github.io/origami/", 
	description: "Origami is a free tool for designing modern user interfaces. Quickly put ... Export code snippets to iOS, Android, and the web with a click.",  
	section_id: s503.id, 
	group_id: read.id,
	accepted: true)


e50401 = Entry.create(
	title: "BJR Typography", 
	link: "http://bjrtypo.com/", 
	description: "A curated collection of free and paying fonts with a small preview of each font.",  
	section_id: s504.id, 
	group_id: make.id,
	accepted: true)

e50402 = Entry.create(
	title: "Typewolf", 
	link: "https://www.typewolf.com/", 
	description: "One of the best resources available for everything related to typography on the web. The author Jeremiah Shoaf has been a professional designer for 14 years so everything on Typewolf is approached from a designer’s perspective.",  
	section_id: s504.id, 
	group_id: read.id,
	accepted: true)

e50403 = Entry.create(
	title: "Typegenius", 
	link: "http://www.typegenius.com/", 
	description: "Find the perfect font combo for your next project.",  
	section_id: s504.id, 
	group_id: make.id,
	accepted: true)

e50404 = Entry.create(
	title: "Fontsquirrel", 
	link: "http://www.fontsquirrel.com/", 
	description: "100% free commercial fonts.",  
	section_id: s504.id, 
	group_id: make.id,
	accepted: true)

e50405 = Entry.create(
	title: "Google Fonts", 
	link: "https://www.google.com/fonts", 
	description: "Free, open-source fonts optimized for the web.",  
	section_id: s504.id, 
	group_id: make.id,
	accepted: true)

e50406 = Entry.create(
	title: "Beautiful Web Type", 
	link: "http://hellohappy.org/beautiful-web-type/", 
	description: "A showcase of the best typefaces from the Google web fonts directory.",  
	section_id: s504.id, 
	group_id: read.id,
	accepted: true)

e50407 = Entry.create(
	title: "Font-to-width", 
	link: "http://font-to-width.com/", 
	description: "Font-to-Width is a script by Nick Sherman and Chris Lewis that takes advantage of large type families to fit pieces of text snugly within their containers.",  
	section_id: s504.id, 
	group_id: make.id,
	accepted: true)

e50408 = Entry.create(
	title: "Edge Web Fonts by Adobe", 
	link: "https://edgewebfonts.adobe.com/", 
	description: "The free, easy way to get started with web fonts.",  
	section_id: s504.id, 
	group_id: make.id,
	accepted: true)

e50409 = Entry.create(
	title: "Typekit by Adobe", 
	link: "https://typekit.com/fonts?collection=trial&licenses=desktop", 
	description: "A limited collection of fonts to use on a website or in applications.",  
	section_id: s504.id, 
	group_id: make.id,
	accepted: true)

e50410 = Entry.create(
	title: "WhatFont Chrome Plugin", 
	link: "https://chrome.google.com/webstore/detail/whatfont/jabopobgcpjmedljpbcaablpmlmfcogm?hl=en", 
	description: "The easiest way to identify fonts on web pages.",  
	section_id: s504.id, 
	group_id: make.id,
	accepted: true)


e50501 = Entry.create(
	title: "Adobe Color Wheel", 
	link: "https://color.adobe.com/create/color-wheel/?base=2&rule=Compound&selected=2&name=Mein%20Color-Thema&mode=rgb&rgbvalues=0.09220001876348626,0.49195499392574354,0.6196078431372549,0.27224317478187443,0.38393996162448035,0.41960784313725485,0.20392156862745095,0.8196078431372549,0.63137254901968,0.842156862745098,0.44795994507130854,0.42007106670419364,0.6196078431372549,0.09220001876348626,0.2364253431356237&swatchOrder=0,1,2,3,4", 
	description: "Create your own color scheme with the Adobe Color Wheel.",  
	section_id: s505.id, 
	group_id: make.id,
	accepted: true)

e50502 = Entry.create(
	title: "ColorZilla", 
	link: "http://www.colorzilla.com/chrome/", 
	description: "With ColorZilla you can get a color reading from any point in your browser, quickly adjust this color and paste it into another program. You can analyze the page and inspect a palette of its colors and many more things.",  
	section_id: s505.id, 
	group_id: make.id,
	accepted: true)

e50503 = Entry.create(
	title: "Flat UI Colors", 
	link: "http://flatuicolors.com/", 
	description: "This small web app helps you to copy the colors from Flat UI. It's kind of responsive, so you can use it with a tiny browser like a widget.",  
	section_id: s505.id, 
	group_id: make.id,
	accepted: true)

e50504 = Entry.create(
	title: "Material Design Colors", 
	link: "http://www.materialui.co/colors", 
	description: "Convenient way to copy and paste any color of Material UI. Great tool for designer and developer.",  
	section_id: s505.id, 
	group_id: make.id,
	accepted: true)

e50505 = Entry.create(
	title: "Noun Project", 
	link: "https://thenounproject.com/", 
	description: "The Noun Project is a website that aggregates and catalogs symbols that are created and uploaded by graphic designers around the world.",  
	section_id: s505.id, 
	group_id: make.id,
	accepted: true)

e50506 = Entry.create(
	title: "Icon Finder", 
	link: "https://www.iconfinder.com/", 
	description: "Iconfinder provides beautiful icons to millions of designers and developers. Now it hosts the worlds largest collection of premium icons.",  
	section_id: s505.id, 
	group_id: make.id,
	accepted: true)

e50507 = Entry.create(
	title: "Font Awesome", 
	link: "http://fortawesome.github.io/Font-Awesome/", 
	description: "One Font, 585 Icons. Font Awesome gives you scalable vector icons that can instantly be customized — size, color, drop shadow, and anything that can be done with the power of CSS. And it's all 100% free.",  
	section_id: s505.id, 
	group_id: make.id,
	accepted: true)

e50508 = Entry.create(
	title: "Coolors", 
	link: "https://coolors.co/app/cebebe-ece2d0-d5b9b2-a26769-6d2e46", 
	description: "Generate infinite color palettes for your designs and share, export or save it in your profile.",  
	section_id: s505.id, 
	group_id: make.id,
	accepted: true)

e50509 = Entry.create(
	title: "Streamline Icons", 
	link: "http://www.streamlineicons.com/", 
	description: "With 4000 vector icons organized in 97 categories, you get all the icons you need for creating impressive applications, wireframes or websites.",  
	section_id: s505.id, 
	group_id: make.id,
	accepted: true)

e50510 = Entry.create(
	title: "Swift Icons", 
	link: "http://swifticons.com/", 
	description: "A remarkable premium set of 1624 high quality icons, capable of covering 17 wide categories in three editable styles: outlined, filled & colored.",  
	section_id: s505.id, 
	group_id: make.id,
	accepted: true)

e50511 = Entry.create(
	title: "Fancy Items", 
	link: "http://market.designmodo.com/fancy-scene-generator/", 
	description: "The Fancy Items Scene Generator is an awesome graphic pack. This set of items comes with more than 440+ items, inspired by the best industrial designers.",  
	section_id: s505.id, 
	group_id: make.id,
	accepted: true)

e50512 = Entry.create(
	title: "Hipster Logo Generator", 
	link: "http://www.hipsterlogogenerator.com/", 
	description: "It’s Hip, It’s Current, It’s Stylish, It’s Hipster. Many wow!",  
	section_id: s505.id, 
	group_id: make.id,
	accepted: true)

e50513 = Entry.create(
	title: "Materal Palette", 
	link: "http://www.materialpalette.com/", 
	description: "Generate & export your Material Design color palette.",  
	section_id: s505.id, 
	group_id: make.id,
	accepted: true)

e50514 = Entry.create(
	title: "Flat UI Color Picker", 
	link: "http://www.flatuicolorpicker.com/", 
	description: "Best flat colors for UI design.",  
	section_id: s505.id, 
	group_id: make.id,
	accepted: true)

e50515 = Entry.create(
	title: "Adaptive backgrounds for jQuery", 
	link: "http://briangonzalez.github.io/jquery.adaptive-backgrounds.js/", 
	description: "A jQuery plugin for extracting dominant colors from images and applying it to its parent.",  
	section_id: s505.id, 
	group_id: make.id,
	accepted: true)

e50516 = Entry.create(
	title: "Brand Colors", 
	link: "http://brandcolors.net/", 
	description: "Colors used by famous brands.",  
	section_id: s505.id, 
	group_id: read.id,
	accepted: true)

e50517 = Entry.create(
	title: "0 to 255", 
	link: "http://www.0to255.com/", 
	description: "Simple tool that helps you find variations of any color.",  
	section_id: s505.id, 
	group_id: make.id,
	accepted: true)

e50518 = Entry.create(
	title: "Bootflat", 
	link: "http://bootflat.github.io/color-picker.html", 
	description: "Perfect colors for flat designs.",  
	section_id: s505.id, 
	group_id: make.id,
	accepted: true)

e50519 = Entry.create(
	title: "HEX to RGB", 
	link: "http://hex.colorrrs.com/", 
	description: "Converts hex to rgb.",  
	section_id: s505.id, 
	group_id: make.id,
	accepted: true)

e50520 = Entry.create(
	title: "UI Colors", 
	link: "http://getuicolors.com/", 
	description: "Get awesome UI colors.",  
	section_id: s505.id, 
	group_id: make.id,
	accepted: true)


e50601 = Entry.create(
	title: "Unsplash", 
	link: "https://unsplash.com/", 
	description: "Free (do whatever you want) high-resolution photos. 10 new photos every 10 days and amazing quality.",  
	section_id: s506.id, 
	group_id: make.id,
	accepted: true)

e50602 = Entry.create(
	title: "Raumrot", 
	link: "http://raumrot.com/", 
	description: "Free handpicked stockphotos for your commercial and personal works.",  
	section_id: s506.id, 
	group_id: make.id,
	accepted: true)

e50603 = Entry.create(
	title: "Pexels", 
	link: "https://www.pexels.com/", 
	description: "Collection of free-to-use stock photos.",  
	section_id: s506.id, 
	group_id: make.id,
	accepted: true)

e50604 = Entry.create(
	title: "Stock Up", 
	link: "http://www.sitebuilderreport.com/stock-up", 
	description: "Search 26 high-quality, free stock photo websites in one place.",  
	section_id: s506.id, 
	group_id: make.id,
	accepted: true)

e50605 = Entry.create(
	title: "Tips to Help You Properly Mix Text With Imagery", 
	link: "http://webdesign.tutsplus.com/articles/tips-to-help-you-properly-mix-text-with-imagery--cms-21575", 
	description: "Design decisions related to this technique are incredibly important to consider, and developing best practices to govern this practice is imperative to retaining high quality design. One cannot simply place text over any image and expect it to look right.",  
	section_id: s506.id, 
	group_id: read.id,
	accepted: true)

e50606 = Entry.create(
	title: "Tinyjpg / Tinypng", 
	link: "https://tinyjpg.com/", 
	description: "Compress JPEG and PNG files with a perfect balance in quality and file size.",  
	section_id: s506.id, 
	group_id: make.id,
	accepted: true)

e50607 = Entry.create(
	title: "Compressor.io", 
	link: "https://compressor.io/", 
	description: "Compress and optimize your images.",  
	section_id: s506.id, 
	group_id: make.id,
	accepted: true)

e50608 = Entry.create(
	title: "ImageOptim", 
	link: "https://imageoptim.com/", 
	description: "ImageOptim is a free app that makes images take up less disk space and load faster, without sacrificing quality.",  
	section_id: s506.id, 
	group_id: make.id,
	accepted: true)

e50609 = Entry.create(
	title: "Pixlr", 
	link: "https://pixlr.com/editor/", 
	description: "Pixlr Editor is a robust browser photo editor.",  
	section_id: s506.id, 
	group_id: make.id,
	accepted: true)

e50610 = Entry.create(
	title: "Easel.ly", 
	link: "http://www.easel.ly/", 
	description: "Empowers anyone to create & share powerful visuals.",  
	section_id: s506.id, 
	group_id: make.id,
	accepted: true)

e50611 = Entry.create(
	title: "Social Image Resizer Tool", 
	link: "http://www.internetmarketingninjas.com/seo-tools/favicon-generator-crop-images/", 
	description: "Create optimized images for social media.",  
	section_id: s506.id, 
	group_id: make.id,
	accepted: true)

e50612 = Entry.create(
	title: "Meme Generator", 
	link: "http://memegenerator.net/", 
	description: "The first online meme generator.",  
	section_id: s506.id, 
	group_id: make.id,
	accepted: true)

e50613 = Entry.create(
	title: "Spruce", 
	link: "http://www.tryspruce.com/", 
	description: "Make Twitter ready images in seconds.",  
	section_id: s506.id, 
	group_id: make.id,
	accepted: true)

e50614 = Entry.create(
	title: "Batch", 
	link: "https://batch.com/", 
	description: "Marketing and transactional push notifications in the same interface.",  
	section_id: s506.id, 
	group_id: make.id,
	accepted: true)

e50615 = Entry.create(
	title: "Splashbase", 
	link: "http://www.splashbase.co/", 
	description: "Search & discover free, hi res photos & videos.",  
	section_id: s506.id, 
	group_id: make.id,
	accepted: true)

e50616 = Entry.create(
	title: "Jay Mantri", 
	link: "http://jaymantri.com/", 
	description: "Free pics.",  
	section_id: s506.id, 
	group_id: make.id,
	accepted: true)

e50617 = Entry.create(
	title: "Foodies Feed", 
	link: "https://foodiesfeed.com/", 
	description: "Free food pictures.",  
	section_id: s506.id, 
	group_id: make.id,
	accepted: true)

e50618 = Entry.create(
	title: "Super Famous", 
	link: "http://images.superfamous.com/", 
	description: "Free pics.",  
	section_id: s506.id, 
	group_id: make.id,
	accepted: true)

e50619 = Entry.create(
	title: "New Old Stock", 
	link: "http://nos.twnsnd.co/", 
	description: "Vintage photos from the US public archives, free of known copyright restrictions.",  
	section_id: s506.id, 
	group_id: make.id,
	accepted: true)

e50620 = Entry.create(
	title: "The Pattern Library", 
	link: "http://thepatternlibrary.com/#geometrica", 
	description: "Free patterns for your projects.",  
	section_id: s506.id, 
	group_id: make.id,
	accepted: true)

e50621 = Entry.create(
	title: "Stocksnap", 
	link: "https://stocksnap.io/", 
	description: "Beautiful free stock photos.",  
	section_id: s506.id, 
	group_id: make.id,
	accepted: true)


e50701 = Entry.create(
	title: "LAPA - Landing Pages Collection", 
	link: "http://lapa.ninja/", 
	description: "A curated collection of landing pages for inspiration.",  
	section_id: s507.id, 
	group_id: make.id,
	accepted: true)

e50702 = Entry.create(
	title: "The Anatomy of a High Converting Landing Page", 
	link: "http://www.quicksprout.com/2013/10/17/the-anatomy-of-a-high-converting-landing-page/?display=wide", 
	description: "A breakdown of each element of a landing page with guidelines on how to improve your conversion rate.",  
	section_id: s507.id, 
	group_id: read.id,
	accepted: true)

e50703 = Entry.create(
	title: "The Crazy Egg case study", 
	link: "http://www.conversion-rate-experts.com/crazy-egg-case-study/", 
	description: "In this case study—which we believe is our most useful one yet—you’ll see specific methods for getting win after win from a site that already is an extremely strong performer.",  
	section_id: s507.id, 
	group_id: read.id,
	accepted: true)

e50704 = Entry.create(
	title: "'The big picture of conversion rate optimization' by Rand Fishkin from Moz", 
	link: "https://moz.com/rand/broadening-our-thinking-on-the-practice-of-conversion-rate-optimization/", 
	description: "In this 19 minute one, Rand Fishkin from Moz uses a presentation he's given a couple times this year against a whiteboard backdrop to tackle the big picture of CRO.",  
	section_id: s507.id, 
	group_id: watch.id,
	accepted: true)

e50705 = Entry.create(
	title: "The Art of the Landing Page: 7 Tips For Increasing Conversions", 
	link: "http://searchenginewatch.com/sew/opinion/2048835/the-art-landing-page-tips-for-increasing-conversions", 
	description: "Landing page optimization and testing can have a dramatic impact on your online marketing profitability. But even without testing you can quickly eliminate several common mistakes that can instantly skyrocket conversion rates.",  
	section_id: s507.id, 
	group_id: read.id,
	accepted: true)

e50706 = Entry.create(
	title: "Landing Page Best Practices", 
	link: "https://vwo.com/blog/landing-page-best-practices/#.", 
	description: "Oli Gardner (@unbounce on Twitter), who is a Co-founder of Unbounce.com talks about landing page best practices.",  
	section_id: s507.id, 
	group_id: read.id,
	accepted: true)

e50707 = Entry.create(
	title: "How to successfully validate your idea with a Landing Page MVP", 
	link: "https://medium.com/@joelgascoigne/how-to-successfully-validate-your-idea-with-a-landing-page-mvp-ef3c2d02dc51", 
	description: "Joel Gascoigne on how to validate your idea with a landing page MVP.",  
	section_id: s507.id, 
	group_id: read.id,
	accepted: true)

e50708 = Entry.create(
	title: "544 Conversion Rate Optimization Tips (now 846 and counting)", 
	link: "http://unbounce.com/conversion-rate-optimization/544-conversion-rate-optimization-tips/", 
	description: "The collection of links below brings together over 500 tips on conversion rate optimization and landing page improvement. Naturally, there will be some repetition of the core principles, but it’s a good idea to read the perspective of several experts when forming your own opinion.",  
	section_id: s507.id, 
	group_id: read.id,
	accepted: true)

e50709 = Entry.create(
	title: "10 techniques for an effective ‘call to action’", 
	link: "https://boagworld.com/design/10-techniques-for-an-effective-call-to-action", 
	description: "Every website should have a call to action, a response you want users to complete. But how do you encourage users to act? How do you create an effective call to action?",  
	section_id: s507.id, 
	group_id: read.id,
	accepted: true)

e50710 = Entry.create(
	title: "10 Tips for Writing the Ultimate Landing Page", 
	link: "http://www.copyblogger.com/seal-the-deal-10-tips-for-writing-the-ultimate-landing-page/", 
	description: "10 Tips on how to improve your landing page, focused on writing content.",  
	section_id: s507.id, 
	group_id: read.id,
	accepted: true)

e50711 = Entry.create(
	title: "10 Principles Of Effective Web Design", 
	link: "http://www.smashingmagazine.com/2008/01/10-principles-of-effective-web-design/", 
	description: "The principles mentioned in this article are also very relevant to keep in mind when building your landing page.",  
	section_id: s507.id, 
	group_id: read.id,
	accepted: true)

e50712 = Entry.create(
	title: "101 Conversion Optimization Tips, Tactics, and Techniques", 
	link: "https://www.ventureharbour.com/101-conversion-rate-optimization-tips/", 
	description: "To get you started with conversion optimization, here’s a giant list of 101 actionable tips on conversion rate optimization, divided up into five sections: color psychology, copywriting tips, sales funnel & landing page streamlining, split-testing, and some general tips.",  
	section_id: s507.id, 
	group_id: read.id,
	accepted: true)


e60101 = Entry.create(
	title: "How to start a startup - Lecture 16 - How to Run a User Interview", 
	link: "https://www.youtube.com/watch?v=qAws7eXItMk", 
	description: "Building product, and talking to users. In the early stages of your startup, those are the two things you should focus on. In this lecture, Emmett Shear, Founder and CEO of Justin.tv and Twitch, covers the latter. What can you learn by talking to users that you can’t learn by looking at data? What questions should you ask? How can user interviews define or redefine your product goals?",  
	section_id: s601.id, 
	group_id: watch.id,
	accepted: true)

e60102 = Entry.create(
	title: "Google Trends", 
	link: "https://www.google.com/trends/", 
	description: "Displays trending searches on Google. Very powerful when researching keywords.",  
	section_id: s601.id, 
	group_id: make.id,
	accepted: true)

e60103 = Entry.create(
	title: "Buzzsumo", 
	link: "http://buzzsumo.com/", 
	description: "Analyze what content performs best for any topic or competitor.",  
	section_id: s601.id, 
	group_id: make.id,
	accepted: true)

e60104 = Entry.create(
	title: "Twitter Trends", 
	link: "https://mobile.twitter.com/trends", 
	description: "See what's trending on Twitter.",  
	section_id: s601.id, 
	group_id: make.id,
	accepted: true)

e60105 = Entry.create(
	title: "Reddit", 
	link: "https://www.reddit.com/", 
	description: "Find trending content and ideas.",  
	section_id: s601.id, 
	group_id: make.id,
	accepted: true)

e60106 = Entry.create(
	title: "Typeform", 
	link: "http://www.typeform.com/", 
	description: "The best tool to create beautiful forms, and it's super easy to use.",  
	section_id: s601.id, 
	group_id: make.id,
	accepted: true)

e60106 = Entry.create(
	title: "Survey Monkey", 
	link: "https://www.surveymonkey.com/", 
	description: "Create surveys. The basics are always free. Upgrade for more powerful features.",  
	section_id: s601.id, 
	group_id: make.id,
	accepted: true)

e60106 = Entry.create(
	title: "Google Forms", 
	link: "https://www.google.com/forms/about/", 
	description: "Create surveys for free.",  
	section_id: s601.id, 
	group_id: make.id,
	accepted: true)

e60107 = Entry.create(
	title: "Have you Talked to your Customers Recently?", 
	link: "https://medium.com/@ramicube/have-you-talked-to-your-customers-recently-f1818076d63", 
	description: "Create surveys for free.If you are at a start-up it is crucial to talk to your customers in the flesh. It can mean the difference between blindly building a product that no one uses to one that actually adds value to your end user.",  
	section_id: s601.id, 
	group_id: read.id,
	accepted: true)

e60108 = Entry.create(
	title: "How to Structure (and get the most out of) Customer Development Interviews", 
	link: "http://jasonevanish.com/2012/01/18/how-to-structure-and-get-the-most-out-of-customer-development-interviews/", 
	description: "As you commit yourself to “getting outside the building” to talk to your customers and truly quest for Product-Market Fit, it’s essential you make the most of those discussions. Written by Jason Evanish of Lighthouse.",  
	section_id: s601.id, 
	group_id: read.id,
	accepted: true)


e60201 = Entry.create(
	title: "Crossing the Chasm: Marketing and Selling High-Tech Products to Mainstream Customers", 
	link: "http://www.amazon.com/Crossing-Chasm-Geoffrey-Moore/dp/0060517123?tag=lessolearn01-20&camp=0&creative=0&linkCode=as4&creativeASIN=0976470705&adid=0E34NG800FT9HMWYP4D6", 
	description: "A bestselling book by Geoffrey A. Moore that created a new game plan for marketing in high-tech industries.",  
	section_id: s602.id, 
	group_id: read.id,
	accepted: true)

e60202 = Entry.create(
	title: "Go To Market To Win", 
	link: "http://seanonstartups.co/2014/03/04/go-to-market-to-win/", 
	description: "The blogger from 'Sean on Startups' writes about what makes a good go to market strategy.",  
	section_id: s602.id, 
	group_id: read.id,
	accepted: true)

e60203 = Entry.create(
	title: "How to Get to Your First 1,000 Users", 
	link: "http://mashable.com/2012/06/27/startup-guide-1000-users/#Y7nwMWboggqD", 
	description: "William Griggs provides a step-by-step process you can use to generate quantifiable traction you need to support your future fundraising efforts and that helps you secure additional press coverage.",  
	section_id: s602.id, 
	group_id: read.id,
	accepted: true)

e60204 = Entry.create(
	title: "How to Start a Startup - Lecture 6 - Growth", 
	link: "https://www.youtube.com/watch?v=n_yHZ_vKjno", 
	description: "Alex Schultz gives an overview of Growth for startups, speaking from a position of authority as the VP of Growth at Facebook.",  
	section_id: s602.id, 
	group_id: watch.id,
	accepted: true)

e60205 = Entry.create(
	title: "The Ultimate Startup Marketing Strategy", 
	link: "https://www.ventureharbour.com/ultimate-startup-marketing-strategy/#chapter3", 
	description: "Two fundamental truths exist when marketing a startup. One is that a great product alone is not enough to succeed. The other is that no amount of marketing will make a crap product gain a mass audience. The article provides a good overview of startup marketing tools & techniques.",  
	section_id: s602.id, 
	group_id: read.id,
	accepted: true)

e60206 = Entry.create(
	title: "Primer by Google", 
	link: "https://www.yourprimer.com/", 
	description: "Primer is a fast, easy way to learn new marketing skills.",  
	section_id: s602.id, 
	group_id: learn.id,
	accepted: true)

e60207 = Entry.create(
	title: "Email University: Become a Better Marketer", 
	link: "http://www.mailcharts.com/email-marketing-best-practices", 
	description: "A free email course to help you become a better marketer. Learn email marketing best practices and understand everything from traffic generation to email optimization.",  
	section_id: s602.id, 
	group_id: learn.id,
	accepted: true)

e60208 = Entry.create(
	title: "Petithacks", 
	link: "http://petithacks.com/", 
	description: "Acquisition, retention, & revenue hacks used by companies.",  
	section_id: s602.id, 
	group_id: read.id,
	accepted: true)

e60209 = Entry.create(
	title: "Growth Hackers", 
	link: "https://growthhackers.com/", 
	description: "Community centered around growth hacking.",  
	section_id: s602.id, 
	group_id: read.id,
	accepted: true)

e60210 = Entry.create(
	title: "Influence: The Psychology of Persuasion by Robert B. Cialdini", 
	link: "http://www.amazon.com/Influence-Psychology-Persuasion-Business-Essentials/dp/006124189X", 
	description: "Influence, the classic book on persuasion, explains the psychology of why people say \"yes\"—and how to apply these understandings.",  
	section_id: s602.id, 
	group_id: read.id,
	accepted: true)

e60211 = Entry.create(
	title: "How To Become A Customer Acquisition Expert", 
	link: "http://www.coelevate.com/essays/customer-acquisition", 
	description: "Very valuable blog post written By Brian Balfour.",  
	section_id: s602.id, 
	group_id: read.id,
	accepted: true)

e60212 = Entry.create(
	title: "Simon Sinek: How great leaders inspire action", 
	link: "http://www.ted.com/talks/simon_sinek_how_great_leaders_inspire_action#t-1061884", 
	description: "Simon Sinek has a simple but powerful model for inspirational leadership all starting with a golden circle and the question 'Why?'.",  
	section_id: s602.id, 
	group_id: watch.id,
	accepted: true)


e60301 = Entry.create(
	title: "The 33 start-up directories you should be listed on", 
	link: "http://thenextweb.com/insider/2015/04/08/the-33-start-up-directories-you-should-be-listed-on/", 
	description: "After 'a bunch of testing and digging through a lot of bad apples', David Arnoux from thenextweb.com was able to discover which start-up directories are legit and worth spending your time on to grab some initial traction.",  
	section_id: s603.id, 
	group_id: read.id,
	accepted: true)

e60302 = Entry.create(
	title: "Facebook Start", 
	link: "http://fbstart.com/", 
	description: "FbStart is a new program from Facebook designed to help early stage mobile startups build and grow their apps.",  
	section_id: s603.id, 
	group_id: make.id,
	accepted: true)

e60303 = Entry.create(
	title: "Google Keyword Planner", 
	link: "http://adwords.google.com/keywordplanner", 
	description: "Plan your Search Network campaigns, get performance insights, and see keyword ideas.",  
	section_id: s603.id, 
	group_id: make.id,
	accepted: true)

e60304 = Entry.create(
	title: "Mailchimp", 
	link: "http://mailchimp.com/", 
	description: "Send 12,000 emails to 2,000 subscribers for free.",  
	section_id: s603.id, 
	group_id: make.id,
	accepted: true)

e60305 = Entry.create(
	title: "Sumome List Builder", 
	link: "https://sumome.com/app/list-builder", 
	description: "You work hard to get people to your site, the List Builder lightbox makes sure they subscribe to your email list and come back for more.",  
	section_id: s603.id, 
	group_id: make.id,
	accepted: true)

e60306 = Entry.create(
	title: "Sumome Scroll Box", 
	link: "https://sumome.com/app/scroll-box", 
	description: "Politely Grow Your Email List with Scroll Box.",  
	section_id: s603.id, 
	group_id: make.id,
	accepted: true)

e60307 = Entry.create(
	title: "Mailgun", 
	link: "http://www.mailgun.com/", 
	description: "Powerful APIs that enable you to send, receive and track email effortlessly.",  
	section_id: s603.id, 
	group_id: make.id,
	accepted: true)

e60308 = Entry.create(
	title: "A Comprehensive Guide to Facebook Ads", 
	link: "https://moz.com/ugc/a-comprehensive-guide-to-facebook-ads-a-30-minute-crash-course-in-facebook-advertising-17132", 
	description: "A 30 minute Crash Course in Facebook Advertising by Moz.",  
	section_id: s603.id, 
	group_id: learn.id,
	accepted: true)


e60401 = Entry.create(
	title: "Open Site Explorer", 
	link: "https://moz.com/researchtools/ose/", 
	description: "A comprehensive tool for link analysis.",  
	section_id: s604.id, 
	group_id: make.id,
	accepted: true)

e60402 = Entry.create(
	title: "WordPress Yoast SEO Plugin", 
	link: "https://wordpress.org/plugins/wordpress-seo/", 
	description: "Improve your WordPress SEO: Write better content and have a fully optimized WordPress site using Yoast SEO plugin.",  
	section_id: s604.id, 
	group_id: make.id,
	accepted: true)

e60403 = Entry.create(
	title: "SEO Site Checkup", 
	link: "http://seositecheckup.com/", 
	description: "Check your website’s SEO problems for free.",  
	section_id: s604.id, 
	group_id: make.id,
	accepted: true)

e60404 = Entry.create(
	title: "Hubspot Marketing Grader", 
	link: "https://marketing.grader.com/", 
	description: "Grade your marketing and make it better.",  
	section_id: s604.id, 
	group_id: make.id,
	accepted: true)

e60405 = Entry.create(
	title: "Similarweb", 
	link: "http://www.similarweb.com/", 
	description: "Get insights for any website or app.",  
	section_id: s604.id, 
	group_id: make.id,
	accepted: true)

e60406 = Entry.create(
	title: "Alexa", 
	link: "http://www.alexa.com/", 
	description: "Alexa has traffic metrics across the web—an invaluable source for competitive intelligence and strategic insight.",  
	section_id: s604.id, 
	group_id: make.id,
	accepted: true)

e60407 = Entry.create(
	title: "Google Analytics", 
	link: "http://www.google.com/analytics/", 
	description: "A must-have for analyzing your website.",  
	section_id: s604.id, 
	group_id: make.id,
	accepted: true)

e60408 = Entry.create(
	title: "Nibbler", 
	link: "http://nibbler.silktide.com/", 
	description: "Test any website.",  
	section_id: s604.id, 
	group_id: make.id,
	accepted: true)

e60409 = Entry.create(
	title: "Browseo", 
	link: "http://www.browseo.net/", 
	description: "BROWSEO is a web app that allows you to view any webpage without distractions caused by styles. It also highlights parts of a page that are relevant for SEO.",  
	section_id: s604.id, 
	group_id: make.id,
	accepted: true)

e60410 = Entry.create(
	title: "Sitemap Generator", 
	link: "http://www.internetmarketingninjas.com/seo-tools/google-sitemap-generator/", 
	description: "Find Broken Links, Redirects & Site Crawl Tool.",  
	section_id: s604.id, 
	group_id: make.id,
	accepted: true)

e60411 = Entry.create(
	title: "The Beginner's guide to SEO", 
	link: "https://moz.com/beginners-guide-to-seo", 
	description: "New to SEO? Need to polish up your knowledge? The Beginner's Guide to SEO has been read over a million times and provides comprehensive information you need to get on the road to professional quality Search Engine Optimization, or SEO.",  
	section_id: s604.id, 
	group_id: learn.id,
	accepted: true)

e60412 = Entry.create(
	title: "Free Survey Creator", 
	link: "http://www.freesurveycreator.com/", 
	description: "Create free surveys,in less than a minute, start receiving visitor feedback.",  
	section_id: s604.id, 
	group_id: make.id,
	accepted: true)

e60413 = Entry.create(
	title: "Vanity Metrics vs. Actionable Metrics", 
	link: "http://fourhourworkweek.com/2009/05/19/vanity-metrics-vs-actionable-metrics/", 
	description: "The only metrics that entrepreneurs should invest energy in collecting are those that help them make decisions.",  
	section_id: s604.id, 
	group_id: read.id,
	accepted: true)

e60414 = Entry.create(
	title: "Measuring What Matters: How To Pick A Good Metric", 
	link: "http://onstartups.com/tabid/3339/bid/96738/Measuring-What-Matters-How-To-Pick-A-Good-Metric.aspx", 
	description: "Used properly, metrics can provide key insights into our businesses that make the difference between success and failure. But as our capacity to track everything increases, and the tools to do so become easier and more prevalent, the question remains: what is a worthwhile metric to track?",  
	section_id: s604.id, 
	group_id: read.id,
	accepted: true)

e60415 = Entry.create(
	title: "Google Analytics Academy", 
	link: "https://analyticsacademy.withgoogle.com/explorer", 
	description: "Improve your Analytics skills with free online courses from Google.",  
	section_id: s604.id, 
	group_id: learn.id,
	accepted: true)

e60416 = Entry.create(
	title: "Google Analytics YouTube Channel", 
	link: "https://www.youtube.com/user/googleanalytics", 
	description: "Series of videos explaining Google Analytics.",  
	section_id: s604.id, 
	group_id: watch.id,
	accepted: true)

e60417 = Entry.create(
	title: "AARRR (Startup Metrics)", 
	link: "http://startitup.co/guides/374/aarrr-startup-metrics", 
	description: "These 5 metrics represent all of the behaviors of our customers.",  
	section_id: s604.id, 
	group_id: read.id,
	accepted: true)

e60418 = Entry.create(
	title: "The Big Picture of CRO", 
	link: "https://www.youtube.com/watch?v=IzoSHXWXW40", 
	description: "Presentation from Rand Fishkin, CEO of Moz, on Conversion Rate Optimization.",  
	section_id: s604.id, 
	group_id: watch.id,
	accepted: true)

e60419 = Entry.create(
	title: "Great Storytelling With Data: Visualize Simply And Focus Obsessively", 
	link: "http://www.kaushik.net/avinash/storytelling-with-data-simplify-focus-visualize-outcomes/", 
	description: "Avinash Kaushik gives strategies you can use to ensure that you present your message with radical simplicity and with an incredible focus. Your goal is going to be to present your why and so what so quickly that the attention moves away from the data and on to a discussion.",  
	section_id: s604.id, 
	group_id: read.id,
	accepted: true)


e60501 = Entry.create(
	title: "CoSchedule Click to Tweet", 
	link: "http://coschedule.com/click-to-tweet", 
	description: "Create beautiful Click To Tweet boxes in your blog posts.",  
	section_id: s605.id, 
	group_id: make.id,
	accepted: true)

e60502 = Entry.create(
	title: "Latergramme", 
	link: "https://www.latergram.me/", 
	description: "Schedule & Manage your Instagram Posts",  
	section_id: s605.id, 
	group_id: make.id,
	accepted: true)

e60503 = Entry.create(
	title: "WordPress 'Pin it' Button", 
	link: "https://wordpress.org/plugins/pinterest-pin-it-button-for-images/", 
	description: "Add a 'Pin It' button over your images, so users can add it to Pinterest easily.",  
	section_id: s605.id, 
	group_id: make.id,
	accepted: true)

e60504 = Entry.create(
	title: "SharedCount", 
	link: "http://www.sharedcount.com/", 
	description: "Track URL shares, likes, tweets, and more.",  
	section_id: s605.id, 
	group_id: make.id,
	accepted: true)

e60505 = Entry.create(
	title: "How many shares?", 
	link: "http://howmanyshares.com/", 
	description: "Track URL shares, likes, tweets, and more.",  
	section_id: s605.id, 
	group_id: make.id,
	accepted: true)

e60506 = Entry.create(
	title: "SocialRank", 
	link: "https://socialrank.com/", 
	description: "Identify, organize, and manage your followers on Twitter and Instagram.",  
	section_id: s605.id, 
	group_id: make.id,
	accepted: true)

e60507 = Entry.create(
	title: "Social Analytics Chrome Plugin", 
	link: "https://chrome.google.com/webstore/detail/social-analytics/pgckigmaefoaemjpijdepakcghjkggmg", 
	description: "Social Analytics shows interactions for a URL on most social platforms.",  
	section_id: s605.id, 
	group_id: make.id,
	accepted: true)

e60508 = Entry.create(
	title: "Buffer", 
	link: "https://buffer.com/", 
	description: "Schedule posts to Twitter, Facebook, Linkedin, Google+.",  
	section_id: s605.id, 
	group_id: make.id,
	accepted: true)

e60509 = Entry.create(
	title: "Bitly", 
	link: "https://bitly.com/", 
	description: "Create, share, and track shortened links.",  
	section_id: s605.id, 
	group_id: make.id,
	accepted: true)

e60510 = Entry.create(
	title: "Filament", 
	link: "http://filament.io/flare", 
	description: "A free beautiful and customizable sharing bar.",  
	section_id: s605.id, 
	group_id: make.id,
	accepted: true)

e60511 = Entry.create(
	title: "Sumome Share", 
	link: "https://sumome.com/app/share", 
	description: "Auto-optimizes your share buttons for max traffic.",  
	section_id: s605.id, 
	group_id: make.id,
	accepted: true)


e60601 = Entry.create(
	title: "How to email a busy person", 
	link: "https://medium.com/@vanschneider/how-to-e-mail-a-busy-person-2e9d9ff0a1af", 
	description: "By Tobias van Schneider, Director of Fun & Product Design Lead at Spotify NYC.",  
	section_id: s606.id, 
	group_id: read.id,
	accepted: true)

e60602 = Entry.create(
	title: "How to Write Clear and Professional Emails", 
	link: "http://business.tutsplus.com/articles/how-to-write-clear-and-professional-emails--cms-20939?", 
	description: "By David Masters.",  
	section_id: s606.id, 
	group_id: read.id,
	accepted: true)

e60603 = Entry.create(
	title: "Email Etiquette for the Super-Busy", 
	link: "http://99u.com/articles/6975/email-etiquette-for-the-super-busy", 
	description: "We’re all extremely busy, and we all get too much email. So what to do?",  
	section_id: s606.id, 
	group_id: read.id,
	accepted: true)

e60604 = Entry.create(
	title: "How to get a busy person to respond to your email", 
	link: "https://medium.com/@mattangriffel/how-to-get-a-busy-person-to-respond-to-your-email-52e5d4d69671", 
	description: "5 rules for good email etiquette, by Mattan Griffel.",  
	section_id: s606.id, 
	group_id: read.id,
	accepted: true)

e60605 = Entry.create(
	title: "You Must Learn How to Write a Damn Good Email", 
	link: "https://medium.com/freelan-ce-ship/you-must-learn-how-to-write-a-damn-good-email-1c8087e02c40", 
	description: "By Lauren Holliday, founder at freelanship.org / growth at inbound.org / entrepreneur editor at sitepoint.",  
	section_id: s606.id, 
	group_id: read.id,
	accepted: true)

e60606 = Entry.create(
	title: "How to Prioritize The Emails You Respond To", 
	link: "http://business.tutsplus.com/tutorials/how-to-prioritize-the-emails-you-respond-to--cms-21201", 
	description: "How should you decide which emails to reply to first? Let's take a look at how you can set the right priorities when you're emptying your email inbox.",  
	section_id: s606.id, 
	group_id: read.id,
	accepted: true)

e60607 = Entry.create(
	title: "Mailtrack", 
	link: "https://mailtrack.io/en/", 
	description: "Know who read your emails and when.",  
	section_id: s606.id, 
	group_id: make.id,
	accepted: true)

e60608 = Entry.create(
	title: "Sidekick", 
	link: "http://www.getsidekick.com/", 
	description: "Know who opens your emails, when, how many times and from where.",  
	section_id: s606.id, 
	group_id: make.id,
	accepted: true)

e60609 = Entry.create(
	title: "Boomerang", 
	link: "http://www.boomeranggmail.com/", 
	description: "Schedule an email to be sent later. Easy email reminders.",   
	section_id: s606.id, 
	group_id: make.id,
	accepted: true)

e60610 = Entry.create(
	title: "How to find email addresses on the internet", 
	link: "http://www.eremedia.com/sourcecon/how-to-find-email-addresses-on-the-internet-part-1/", 
	description: "A list of resources and techniques that will help you find business email addresses.",   
	section_id: s606.id, 
	group_id: read.id,
	accepted: true)

e60611 = Entry.create(
	title: "Email etiquette for entrepreneurs", 
	link: "http://blog.crew.co/email-etiquette-for-entrepreneurs/", 
	description: "A collection of some of the more general trends in advice for various types of emails.",  
	section_id: s606.id, 
	group_id: read.id,
	accepted: true)

e60612 = Entry.create(
	title: "Rapportive", 
	link: "https://rapportive.com/", 
	description: "Rapportive shows you everything about your contacts right inside your inbox.",  
	section_id: s606.id, 
	group_id: make.id,
	accepted: true)

e60613 = Entry.create(
	title: "How to start a startup - Lecture 19 - Sales and Marketing", 
	link: "https://www.youtube.com/watch?v=SHAh6WKBgiE", 
	description: "Three segments in this lecture: 1. Tyler Bosmeny, founder and CEO of Clever, starts off today's lecture with an overview of the Sales Funnel, and how to get to your first $1 Million. 2. Michael Seibel, founder of Justin.tv and Socialcam and Partner at Y Combinator, then goes over how to talk to investors - the pitch. 3. Dalton Caldwell, founder of imeem and App.net and Partner at Y Combiantor, and Qasar Younis, founder of Talkbin and Partner at Y Combinator, then perform an investor meeting roleplay to give you a taste of how it actually might look behind the scenes.",  
	section_id: s606.id, 
	group_id: watch.id,
	accepted: true)

e60614 = Entry.create(
	title: "Startup Sales Course", 
	link: "http://buyin.startupsalesbootcamp.com/", 
	description: "Learn the new framework which brings together psychological hacks used by top sellers.",  
	section_id: s606.id, 
	group_id: learn.id,
	accepted: true)

e60615 = Entry.create(
	title: "Charge what you're worth", 
	link: "http://doubleyourfreelancing.com/free-pricing-course/", 
	description: "A free, 9 lesson course that has helped 15,475+ freelancers learn how to charge more.",  
	section_id: s606.id, 
	group_id: learn.id,
	accepted: true)

e60616 = Entry.create(
	title: "3 Steps to Successful Cold Call in B2B Customer Development", 
	link: "http://blog.raywu.co/3-steps-to-successful-cold-call-in-b2b-customer-development", 
	description: "An article on how to be more successful when selling in B2B.",  
	section_id: s606.id, 
	group_id: read.id,
	accepted: true)

e60617 = Entry.create(
	title: "SPIN Selling - Neil Rackham", 
	link: "http://www.amazon.com/SPIN-Selling-Neil-Rackham/dp/0070511136", 
	description: "Very insightful book on how to sell in B2B, a must-read for people selling to companies.",  
	section_id: s606.id, 
	group_id: read.id,
	accepted: true)


e60702 = Entry.create(
	title: "Want to be a better storyteller? Learn from a comedian", 
	link: "http://blog.crew.co/want-to-be-a-better-storyteller-learn-from-a-comedian/", 
	description: "Published on Crew Blog.",  
	section_id: s607.id, 
	group_id: read.id,
	accepted: true)

e60703 = Entry.create(
	title: "Why Content Goes Viral: the Theory and Proof", 
	link: "https://moz.com/blog/why-content-goes-viral-the-scientific-theory-and-proof", 
	description: "Long-time citizens of the web can often tell from a first-reading or viewing that a piece is going to explode, but why? Opinions about what it takes to be viral are easy to come by, but let’s look at the facts with data to prove it.",  
	section_id: s607.id, 
	group_id: read.id,
	accepted: true)

e60704 = Entry.create(
	title: "How I cut my writing time from 2 days to 4 hours", 
	link: "https://blog.bufferapp.com/how-i-cut-my-writing-time-from-2-days-to-4-hours", 
	description: "Published by Belle Beth Cooper on the Buffer Blog.",  
	section_id: s607.id, 
	group_id: read.id,
	accepted: true)

e60705 = Entry.create(
	title: "Overcoming writer's block: three tips - The Guardian", 
	link: "http://www.theguardian.com/higher-education-network/2014/dec/22/overcoming-writers-block-three-top-tips", 
	description: "People tend to use procrastination as an explanation for writer’s block, says Rowena Murray, but really, they are just avoiding asking for help.",  
	section_id: s607.id, 
	group_id: read.id,
	accepted: true)

e60706 = Entry.create(
	title: "6 of the best pieces of advice from successful writers", 
	link: "https://blog.bufferapp.com/6-of-the-most-important-aspects-of-successful-writing", 
	description: "Published by Belle Beth Cooper on the Buffer Blog.",  
	section_id: s607.id, 
	group_id: read.id,
	accepted: true)

e60707 = Entry.create(
	title: "George Orwell - Politics and the English Language", 
	link: "http://www.orwell.ru/library/essays/politics/english/e_polit", 
	description: "An essay on writing with good style.",  
	section_id: s607.id, 
	group_id: read.id,
	accepted: true)

e60708 = Entry.create(
	title: "How We Publish at Crew", 
	link: "https://medium.com/@missafayres/how-we-publish-at-crew-8fba67eed8ac", 
	description: "Published by Andrea Ayres-Deets.",  
	section_id: s607.id, 
	group_id: read.id,
	accepted: true)

e60709 = Entry.create(
	title: "How I Write 8 Blog Posts a Week While Running 2 Companies", 
	link: "http://www.quicksprout.com/2014/06/30/how-to-streamline-your-content-creation/", 
	description: "How to streamline your content creation process.",  
	section_id: s607.id, 
	group_id: read.id,
	accepted: true)

e60710 = Entry.create(
	title: "A scientific guide to writing popular - and shareable - headlines for Twitter, Facebook, and your blog", 
	link: "http://www.fastcompany.com/3020239/work-smart/a-scientific-guide-to-writing-popular-and-sharable-headlines-for-twitter-facebook", 
	description: "What words are we most attracted to on Twitter? Why do we click on particular pictures on Facebook? How long is too long? Posted on Fastcompany.",  
	section_id: s607.id, 
	group_id: read.id,
	accepted: true)

e60711 = Entry.create(
	title: "The anatomy of the perfect blog post", 
	link: "https://blog.bufferapp.com/perfect-blog-post-research-data", 
	description: "Data on headlines, length, images, and more. Published by Kevan Lee on the Buffer Blog.",  
	section_id: s607.id, 
	group_id: read.id,
	accepted: true)

e60712 = Entry.create(
	title: "The One Score That Can Improve Your Writing With A Single Click", 
	link: "https://medium.com/life-tips/the-one-score-that-can-improve-your-writing-with-a-single-click-2e204ed52fa0", 
	description: "A post by James Altucher on the F-K-Score. Published on Medium.",  
	section_id: s607.id, 
	group_id: read.id,
	accepted: true)

e60713 = Entry.create(
	title: "6 ways I've improved my writing in the past 6 months you can try today", 
	link: "https://blog.bufferapp.com/6-ways-ive-improved-my-writing-in-the-past-6-months", 
	description: "ublished by Belle Beth Cooper on the Buffer Blog.",  
	section_id: s607.id, 
	group_id: read.id,
	accepted: true)

e60714 = Entry.create(
	title: "How I Got 6.2 Million Pageviews and 144,920 Followers", 
	link: "https://medium.com/swlh/how-i-got-6-2-million-pageviews-and-144-920-followers-d4d3fa440802", 
	description: "A 15-minutes guide to blogging, online marketing, and growth.",  
	section_id: s607.id, 
	group_id: read.id,
	accepted: true)

e60715 = Entry.create(
	title: "How to become a columnist: the ultimate blueprint for guest blogging and syndication", 
	link: "https://blog.bufferapp.com/how-to-become-a-columnist-guest-posting-syndication", 
	description: "Published by Kevan Lee on the Buffer Blog.",  
	section_id: s607.id, 
	group_id: read.id,
	accepted: true)

e60716 = Entry.create(
	title: "35 actionable tips to grow your Medium blog", 
	link: "https://medium.com/swlh/35-actionable-tips-to-grow-your-medium-blog-4e4017b89905", 
	description: "Published on Medium by Ali Mese.",  
	section_id: s607.id, 
	group_id: read.id,
	accepted: true)

e60717 = Entry.create(
	title: "Hemingway", 
	link: "http://www.hemingwayapp.com/", 
	description: "Makes your writing bold and clear.",  
	section_id: s607.id, 
	group_id: make.id,
	accepted: true)

e60718 = Entry.create(
	title: "Zenpen", 
	link: "http://www.zenpen.io/", 
	description: "A minimalist writing zone, where you can block out all distractions and get to what's important. The writing!",  
	section_id: s607.id, 
	group_id: make.id,
	accepted: true)

e60719 = Entry.create(
	title: "Liberio", 
	link: "http://liber.io/", 
	description: "Simple eBook creation and publishing right from Google Drive.",  
	section_id: s607.id, 
	group_id: make.id,
	accepted: true)

e60720 = Entry.create(
	title: "WordPress Editorial Calendar", 
	link: "https://wordpress.org/plugins/editorial-calendar/", 
	description: "See all your posts, drag & drop to manage your blog.",  
	section_id: s607.id, 
	group_id: make.id,
	accepted: true)

e60721 = Entry.create(
	title: "WordPress Social Locker", 
	link: "https://wordpress.org/plugins/social-locker/", 
	description: "Helps increase social media presence by asking visitors 'to pay' for your content with a tweet, plus one, or a like.",  
	section_id: s607.id, 
	group_id: make.id,
	accepted: true)

e60722 = Entry.create(
	title: "CoSchedule Headline Analyzer", 
	link: "http://coschedule.com/headline-analyzer#", 
	description: "Blog post headline analyzer.",  
	section_id: s607.id, 
	group_id: make.id,
	accepted: true)

e60723 = Entry.create(
	title: "How to Start a Blog", 
	link: "http://firstsiteguide.com/blogging-intro/", 
	description: "The beginner's guide to successful blogging.",  
	section_id: s607.id, 
	group_id: learn.id,
	accepted: true)

e60724 = Entry.create(
	title: "Disqus", 
	link: "https://disqus.com/", 
	description: "Build a community of active readers & commenters.",  
	section_id: s607.id, 
	group_id: make.id,
	accepted: true)

e60725 = Entry.create(
	title: "Deconstructing PR: Advice From A Former VentureBeat Writer", 
	link: "http://www.startup-marketing.com/deconstructing-pr-advice-from-a-former-venturebeat-writer/", 
	description: "If you can understand the process in which journalists write articles, then you will understand exactly what a writer needs and can greatly improve your chances of coverage.",  
	section_id: s607.id, 
	group_id: read.id,
	accepted: true)


e60801 = Entry.create(
	title: "PS: I Love You. Get Your Free Email at Hotmail", 
	link: "http://techcrunch.com/2009/10/18/ps-i-love-you-get-your-free-email-at-hotmail/", 
	description: "How Hotmail grew its user base with a simple trick.",  
	section_id: s608.id, 
	group_id: read.id,
	accepted: true)

e60802 = Entry.create(
	title: "Noch keine Website, aber schon mal 100.000 E-Mail-Adressen eingesammelt - die Launchstory von Harry's", 
	link: "http://techcrunch.com/2009/10/18/ps-i-love-you-get-your-free-email-at-hotmail/", 
	description: "[German] Wie die Gründer des Rasur-Shops mit einer Referral-Kampagne erfolgreich starteten. Artikel von Online Marketing Rockstars.",  
	section_id: s608.id, 
	group_id: read.id,
	accepted: true)

e60803 = Entry.create(
	title: "How OnePlus One’s marketing made it the most desirable phone in the world", 
	link: "http://thenextweb.com/market-intelligence/2015/03/17/how-oneplus-ones-marketing-made-it-the-most-desirable-phone-in-the-world/", 
	description: "Case study of the OnePlus launch by Ariel Rosenstein on thenextweb.com.",  
	section_id: s608.id, 
	group_id: read.id,
	accepted: true)

e60804 = Entry.create(
	title: "Hands up who’s heard of Tom McElligott?", 
	link: "http://davedye.com/2014/02/07/hands-up-whos-heard-of-tom-mcelligott/", 
	description: "Dave Dye published an amazing collection of the ads of Tom McElligot.",  
	section_id: s608.id, 
	group_id: read.id,
	accepted: true)

e60805 = Entry.create(
	title: "E-mail first. App fourth. How Freeletics launched the right way", 
	link: "http://jan-koenig.com/blog/launch-strategy-freeletics/", 
	description: "Freeletics, a German startup that created an app that provides their users with personalized and challenging bodyweight workouts, somehow managed to stand out and grow from an E-Mail list to more than a million users while bootstrapping for the last two years.",  
	section_id: s608.id, 
	group_id: read.id,
	accepted: true)









#t1 = Tag.create(name: "Tag1")
#t2 = Tag.create(name: "Tag2")
#t3 = Tag.create(name: "Tag3")
#t4 = Tag.create(name: "Tag4")
#t5 = Tag.create(name: "Tag5")
#t6 = Tag.create(name: "Tag6")
#t7 = Tag.create(name: "Tag7")
#t8 = Tag.create(name: "Tag8")
#t9 = Tag.create(name: "Tag9")
#t10 = Tag.create(name: "Tag10")

#e1.tags << [t1, t2, t3, t4]
#e2.tags << [t4, t5, t6, t7]
#e3.tags << [t8, t9, t10]
#e4.tags << [t1, t2, t3, t4]
#e5.tags << [t4, t5]
#e6.tags << [t6, t7, t8, t9]
#e7.tags << [t10]
#e8.tags << [t1, t4]
#e9.tags << [t1, t2, t3, t4]
#e10.tags << [t4]

#s1.entries << [e1, e3, e5, e10]
#s2.entries << [e2, e3, e4, e5, e6]
#s3.entries << [e4, e5, e8, e7, e9]
#s4.entries << [e5, e3, e8, e7, e9]
#s5.entries << [e4, e5, e8, e7, e9]
#s6.entries << [e2, e4, e8, e7, e9]
#s7.entries << [e1, e3, e8, e7, e9]
#s8.entries << [e3, e6, e8, e7, e9]
#s9.entries << [e10]
end
