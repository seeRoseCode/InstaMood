require_relative '../config/environment'
require 'pry'

InstamoodRun.new.run

user1 = User.all[0]
#
#
user1.second_menu
binding.pry
0
