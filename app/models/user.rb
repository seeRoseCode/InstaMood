class User < ActiveRecord::Base
   has_many :moods
   has_many :gifs, through: :moods
end
