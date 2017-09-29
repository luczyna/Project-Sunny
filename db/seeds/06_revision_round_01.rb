# Users have some time to think about their ideas
# and some will be updated

# Ana makes a revision of her popular idea
Version.create(
  idea_id: Idea.where(name: 'Move More').take.id,
  number: 4,
  goal: "Stand up and exercise every hour",
  content: "Do some pushups, lunges, russian twists, planks. Sitting down for long periods of time is a health risk. Find a standing desk or similar solution, and strive to use it."
)

# Bana unpublishes her Instrument Idea--no one liked it!
Idea.where(name: 'Play Ukulele').take.update(published: false)

# Lana has another stroke of brilliance
cant_go_wrong_idea = Idea.create(
  user: User.where(username: 'lana').take,
  name: 'Become Ninja',
  published: true
)

Version.create(
  idea: cant_go_wrong_idea,
  number: 1,
  goal: 'To follow my way, the way of the Ninja',
  content: 'I would like to train to become the ultimate ninja, and become Hokage.'
)
