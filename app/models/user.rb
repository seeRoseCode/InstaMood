require 'pry'
class User < ActiveRecord::Base
   has_many :moods
   has_many :gifs, through: :moods
   has_one :rating

   def list_moods
     moods = self.moods
     if moods == []
       puts "you don't have any moods."
       system("say", "you don't have any moods.")
     else
       moods.each do |mood|
         puts "#{mood.id}. #{mood.gif.url} \n #{mood.caption}"
       end
     end
   end

   def retrieve_mood(id)
     Mood.all.find(id)
   end

   def retrieve_last_mood
    last_mood = self.moods.last
    if last_mood == nil
      puts "You don't have any moods"
      system("say", "you don't have any moods")
    else
      last_mood
    end
   end

   def update_last_mood
     mood = retrieve_last_mood
     puts "please enter your new caption"
     system("say", "enter your new caption")
     new_caption = gets.chomp
     mood.update(caption: new_caption)
     puts "your new caption is #{new_caption}"
     system("say", "your new caption is. #{new_caption}")
   end

   def update_mood_by_id
     self.list_moods
     id = gets.chomp.to_i
     if id == 0
       puts "please enter a number"
       system("say", "please enter a number")
     else
       mood = retrieve_mood(id)
       puts "please enter your new caption"
       system("say", "enter your new caption")
       new_caption = gets.chomp
       mood.update(caption: new_caption)
       puts "your new caption is #{new_caption}"
       system("say", "your new caption is. #{new_caption}")
     end
   end

   def delete_mood#COMPLETE
     mood = retrieve_last_mood
     mood.destroy
     puts "your mood has been deleted"
     system("say", "your mood has been deleted")
   end

   def delete_all_moods#COMPLETE
    self.moods.destroy_all
    puts "All gone!"
    system("say", "all gone")
   end


   def user_input
     gets.chomp.downcase
   end


end
