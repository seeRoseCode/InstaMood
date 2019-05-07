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
     puts Mood.all.find(id)
   end

end
