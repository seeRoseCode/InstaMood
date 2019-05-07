user1 = User.create(
  name: "Kesha"
)

user2 = User.create(
  name: "Paula"
)

user3 = User.create(
  name: "Blake"
)

gif1 = Gif.create(
  category: "happy",
  url: "https://media1.giphy.com/media/10t57cXgo7x5kI/giphy.gif?cid=790b76115cd17aea5853777541a677f4&rid=giphy.gif",
  desc: "smiling dog"
)

gif2 = Gif.create(
  category: "sad",
  url: "https://media0.giphy.com/media/58FMysL4cmjsIales5/giphy.gif?cid=790b76115cd17c85334b51596b6ad404&rid=giphy.gif",
  desc: "I wanna cry"
)

gif3 = Gif.create(
  category: "imposter",
  url: "https://media.giphy.com/media/dt55CHaeQTNIfMpLRV/giphy.gif",
  desc: "impasta"
)

mood1 = Mood.create(
  gif_id: gif1.id,
  user_id: user1.id,
  caption: "I'm so happy today!"
)
