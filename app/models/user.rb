require 'pry'
class User < ActiveRecord::Base
   has_many :moods
   has_many :gifs, through: :moods

   def list_moods
     moods = self.moods
     moods.each do |mood|
     puts "#{mood.id}. #{mood.gif.url} \n #{mood.caption}"
     end
   end

   def retrieve_mood(id)
     Mood.all.find(id)
   end

   def update_mood(id)
     mood = retrieve_mood(id)
     puts "please enter your new caption"
     new_caption = gets.chomp
     mood.update(caption: new_caption)
     puts "your new caption is #{new_caption}"
     mood
   end


   def delete_moods
     list_moods
     puts "If you're sure you want to delete your previous gifs, please type 'yes'"
     decision = user_input
     if decision == 'yes'
       self.moods.destroy_all
       puts "All done!"
     end
   end


   def user_input
     gets.chomp.downcase
   end

end
