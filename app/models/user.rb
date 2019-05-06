class User < ActiveRecord::Base
  has_many :gifs, through: :joins
  has_many :joins
end



#trying this push stuff.
