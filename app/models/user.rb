require 'pry'
class User < ActiveRecord::Base
   has_many :moods
   has_many :gifs, through: :moods

   def list_moods
     Mood.all.each do |mood|
       puts "#{mood.gif_id.url} \n #{mood.caption}"
       binding.pry
     end
   end


end
