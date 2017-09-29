# A User named Ana
user = User.where(username: 'ana').take

# Makes two idea
moving_idea = Idea.create(
  user_id: user.id,
  name: "Move More",
  published: true
)

app_idea = Idea.create(
  user_id: user.id,
  name: "Songbin API",
  published: false
)

# Works on those ideas
# Here are for moving_idea
Version.create(
  idea_id: moving_idea.id,
  number: 1,
  goal: "Stand up every hour",
  content: "Please try to do this, since sitting is way too easy."
)

Version.create(
  idea_id: moving_idea.id,
  number: 2,
  goal: "Stand up and exercise every hour",
  content: "Please try to do this, since sitting is way too easy."
)

Version.create(
  idea_id: moving_idea.id,
  number: 3,
  goal: "Stand up and exercise every hour",
  content: "Do some pushups, lunges, russian twists, planks. Sitting down for long periods of time is a health risk. Please try to do this, since sitting is way too easy."
)

# Here are for app_idea
Version.create(
  idea_id: app_idea.id,
  number: 1,
  goal: "Create an API with Rails",
  content: "In order to foster more use of the app, we can develop an API to power the data transactions of Songbin. Let's use Rails to generate a POC API."
)

Version.create(
  idea_id: app_idea.id,
  number: 2,
  goal: "Create an API with Rails",
  content: "In order to foster more use of the app, we can develop an API to power the data transactions of Songbin. Let's use Rails to generate a POC API. Let's also use this as inspiration for Jonathan in his Python adventure."
)
