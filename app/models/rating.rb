class Rating < ActiveRecord::Base
  belongs_to :user
  has_one :number


end
