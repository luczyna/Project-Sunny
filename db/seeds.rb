# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Users
user_first = User.create(username: "ana", email: "asd@asd.com", password: "poi")
user_second = User.create(username: "bana", email: "wer@wer.com", password: "poi")

# First Users' Ideas
first_good_idea = Idea.create(
  user_id: user_first.id,
  name: "Move More",
  published: true
)

Version.create(
  idea_id: first_good_idea.id,
  number: 1,
  goal: "Stand up every hour",
  content: "Please try to do this, since sitting is way too easy."
)

Version.create(
  idea_id: first_good_idea.id,
  number: 2,
  goal: "Stand up and exercise every hour",
  content: "Please try to do this, since sitting is way too easy."
)

Version.create(
  idea_id: first_good_idea.id,
  number: 3,
  goal: "Stand up and exercise every hour",
  content: "Do some pushups, lunges, russian twists, planks. Sitting down for long periods of time is a health risk. Please try to do this, since sitting is way too easy."
)

second_good_idea = Idea.create(
  user_id: user_first.id,
  name: "Songbin API",
  published: false
)

Version.create(
  idea_id: second_good_idea.id,
  number: 1,
  goal: "Create an API with Rails",
  content: "In order to foster more use of the app, we can develop an API to power the data transactions of Songbin. Let's use Rails to generate a POC API."
)

Version.create(
  idea_id: second_good_idea.id,
  number: 2,
  goal: "Create an API with Rails",
  content: "In order to foster more use of the app, we can develop an API to power the data transactions of Songbin. Let's use Rails to generate a POC API. Let's also use this as inspiration for Jonathan in his Python adventure."
)

# Second Users' Ideas
third_good_idea = Idea.create(
  user_id: user_second.id,
  name: "Get Ready for October",
  published: true
)

Version.create(
  idea_id: third_good_idea.id,
  number: 1,
  goal: "Draw Everyday with Inktober",
  content: "Achieve stardom with Inktober and Instagram! Use this as fodder for your aspirations!"
)

Version.create(
  idea_id: third_good_idea.id,
  number: 2,
  goal: "Draw everyday",
  content: "Post something to the Inktober hashtag in instagram, and don't let that be the only reason why you're drawing."
)

Version.create(
  idea_id: third_good_idea.id,
  number: 3,
  goal: "Draw Draw Draw",
  content: "Try to draw everyday, but be kind to yourself. Post something to the Inktober hashtag in Instagram, and don't let that be the only reason why you're drawing. Enjoy yourself."
)

fourth_good_idea = Idea.create(
  user_id: user_second.id,
  name: "Play Ukulele",
  published: true
)

Version.create(
  idea_id: fourth_good_idea.id,
  number: 1,
  goal: "Learn at least 10 Chords",
  content: "Practice playing all the chords, and memorise at least 10 to muscle memory and heart. I'd like to understand the notes that go into playing a chord, it's name, and have the imagination to think of a song/tune that the chord has been played in."
)

Version.create(
  idea_id: fourth_good_idea.id,
  number: 2,
  goal: "Master 10 Chords",
  content: "Practice playing all the chords, and memorise at least 10 to muscle memory and heart. I'd like to understand the notes that go into playing a chord, it's name, and have the imagination to think of a song/tune that the chord has been played in. I's also like to get some songs down, and just some easy measures to play for simple tunes to relax to."
)
