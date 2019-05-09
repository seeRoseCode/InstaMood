require_relative '../config/environment'
require 'pry'

# InstamoodRun.new.run

user1 = User.all[0]
#
# user1.create_mood

user1.delete_mood(105)
#
# binding.pry
0
