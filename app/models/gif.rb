class Gif < ActiveRecord::Base
	has_many :users, through: :joins
  has_many :joins
end
