require 'pry'
class Rating < ActiveRecord::Base
  belongs_to :user


  def self.app_average#COMPLETE
    all.average(:number).to_i
  end

  def self.display_ratings#COMPLETE
    Rating.all.each do |rating|
      puts "#{rating.user.name} gave Instamood #{rating.number} stars!"
    end
  end

end
