# A User named Lana
user = User.where(username: 'lana').take

# Has one idea
running_idea = Idea.create(
  user_id: user.id,
  name: "Running for 5k",
  published: true
)

# Works on that idea
Version.create(
  idea_id: running_idea.id,
  number: 1,
  goal: "Train to run a 5K",
  content: "Run at least 4 times a week in order to work back up to a 5k distance."
)
