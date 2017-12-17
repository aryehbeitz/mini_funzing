# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

rosens = User.create(name: 'The Rosens', email: 'therosens@therosens.com', password: 'therosens')
donald = User.create(name: 'Donald Smith', email: 'donaldsmith@donaldsmith.com', password: 'donaldsmith')
marcy = User.create(name: 'Marcy Victoria', email: 'marcyvictoria@marcyvictoria.com', password: 'themarcy')

Activity.create(
  title: "Hanukka Party at the Rosens",
  description: "This year, once again, we will be hosting our annual Hanukka Party at the Rosens.\n\nPlease bring $15 dollars and lots of good vibes!\n\nCya!",
  maximum_attendees: 30,
  available_tickets: 30,
  ticket_price: 15,
  date: Time.now+20.days,
  user: rosens)

Activity.create(
  title: "Christmas Party by the Smiths",
  description: "This year, once again, we will be hosting our annual Christmas Party at the Smiths.\n\nPlease bring $22 dollars and lots of good vibes!\n\nCya!",
  maximum_attendees: 30,
  available_tickets: 30,
  ticket_price: 22,
  date: Time.now+20.days,
  user: donald)

Activity.create(
  title: "Purim Party by Marcy",
  description: "This year, once again, we will be hosting our annual Purim Party at Marcy's.\n\nPlease bring 36 dollars and a good costume!\n\nCya!",
  maximum_attendees: 10,
  available_tickets: 10,
  ticket_price: 26,
  date: Time.now+20.days,
  user: marcy)

Activity.create(
  title: "Poetry Reading at the Rosens",
  description: "We will be hosting ou annual Poetry Reading. Please bring your favorite poetry to read and $20.\n\nPlaces limited, so hurry and sign up!",
  maximum_attendees: 20,
  available_tickets: 20,
  ticket_price: 20,
  date: Time.now+20.days,
  user: rosens)

Activity.create(
  title: "Nature Party at Marcy's",
  description: "Come to out annual nature party in the negev desert.\n\nJust $200 for a weekend of trance and meditation",
  maximum_attendees: 200,
  available_tickets: 200,
  ticket_price: 200,
  date: Time.now+20.days,
  user: marcy)

