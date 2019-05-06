require_relative 'config/environment'
require 'sinatra/activerecord/rake'

# desc 'starts a console'
# task :console do
#   ActiveRecord::Base.logger = Logger.new(STDOUT)
#   Pry.start
# end

task :environment do
  require_relative './config/environment'
end


namespace :db do
  desc 'migrate changes to your database'
  task migrate: :environment do
    User.create_table
    Mood.create_table
  end

  desc 'seed the database with some dummy data'
  task :seed do
    require_relative './db/seeds.rb'
  end
end

desc 'drop into the Pry console'
task console: :environment do
  Pry.start
end
