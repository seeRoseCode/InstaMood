User.destroy_all
Mood.destroy_all

happy = Gif.create(
  name: 'Happy',
  gif: 'https://media3.giphy.com/media/3ornkdtVzQfIRpwfug/giphy.gif?cid=790b76115cd07cb33143566b6feb9b02&rid=giphy.gif',
  mood_id: id
)

mood1 = Mood.create(
  gif: happy,
  user: 
)

rose = User.create(
  name: 'Rose',
)

paula = User.create(
  name: 'Paula'
)
