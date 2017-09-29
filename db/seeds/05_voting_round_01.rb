# The Users look at the ideas
ana = User.where(username: 'ana').take
bana = User.where(username: 'bana').take
lana = User.where(username: 'lana').take

def get_latest_version(idea_name)
  Idea.where(name: idea_name).first.versions.order(number: :asc).last
end

# They vote on what they like

# Lana and Bana like the Moving Idea from Ana
Upvote.create(user: lana, version: get_latest_version('Move More'))
Upvote.create(user: bana, version: get_latest_version('Move More'))

# Ana likes Bana's Inktober Idea
Upvote.create(user: ana, version: get_latest_version('Get Ready for October'))

# Ana likes Lana's Running Idea
Upvote.create(user: ana, version: get_latest_version('Get Ready for October'))
