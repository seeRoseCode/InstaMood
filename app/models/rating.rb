require 'pry'
class Rating < ActiveRecord::Base
  belongs_to :user


  def self.app_average#COMPLETE
    all.average(:number).to_i
  end

end
