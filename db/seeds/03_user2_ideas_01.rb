# A User named Bana
user = User.where(username: 'bana').take

# Has two ideas
inktober_idea = Idea.create(
  user_id: user.id,
  name: "Get Ready for October",
  published: true
)

instrument_idea = Idea.create(
  user_id: user.id,
  name: "Play Ukulele",
  published: true
)

# Works on those ideas
# Here is for inktober_idea
Version.create(
  idea_id: inktober_idea.id,
  number: 1,
  goal: "Draw Everyday with Inktober",
  content: "Achieve stardom with Inktober and Instagram! Use this as fodder for your aspirations!"
)

Version.create(
  idea_id: inktober_idea.id,
  number: 2,
  goal: "Draw everyday",
  content: "Post something to the Inktober hashtag in instagram, and don't let that be the only reason why you're drawing."
)

Version.create(
  idea_id: inktober_idea.id,
  number: 3,
  goal: "Draw Draw Draw",
  content: "Try to draw everyday, but be kind to yourself. Post something to the Inktober hashtag in Instagram, and don't let that be the only reason why you're drawing. Enjoy yourself."
)

# Here is for instrument_idea
Version.create(
  idea_id: instrument_idea.id,
  number: 1,
  goal: "Learn at least 10 Chords",
  content: "Practice playing all the chords, and memorise at least 10 to muscle memory and heart. I'd like to understand the notes that go into playing a chord, it's name, and have the imagination to think of a song/tune that the chord has been played in."
)

Version.create(
  idea_id: instrument_idea.id,
  number: 2,
  goal: "Master 10 Chords",
  content: "Practice playing all the chords, and memorise at least 10 to muscle memory and heart. I'd like to understand the notes that go into playing a chord, it's name, and have the imagination to think of a song/tune that the chord has been played in. I's also like to get some songs down, and just some easy measures to play for simple tunes to relax to."
)
