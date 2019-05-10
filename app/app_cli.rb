require 'pry'
class InstamoodRun
  attr_accessor :name

  def run
    system("open", "-g", "IFeelGood.mp3")#working
    Title.title
    sleep 2
    welcome
    sleep 2
    main_menu
    sleep 1
    second_menu
  end

#########################  MAIN METHODS  #####################
  def welcome#COMPLETE
    puts "Welcome to Instamood!"
    system("say", "welcome to insta mood!")
    sleep 1
    puts "Enter your Username"
    name = user_input
    user = User.all.find{|user| user.name == name}
    if user
      @name = user
      puts "Welcome back #{name.capitalize}!"
      system("say", "welcome back #{name}")
    else
      system("say", "hi #{name}")
      @name = create_user(name)
    end
  end

  def main_menu#COMPLETE
    hru#asks how they're feeling
    sleep 1
    feeling = user_input.to_i
    until feeling != 0 && feeling <= 10
      puts "please type a number 1-10"
      system("say", "please type a number 1 through 10")
      feeling = user_input.to_i
    end
    case feeling
      when 1
        gif_options("happy")
      when 2
        gif_options("sad")
      when 3
        gif_options("flirty")
      when 4
        gif_options("angry")
      when 5
        gif_options("excited")
      when 6
        gif_options("calm")
      when 7
        gif_options("hangry")
      when 8
        gif_options("tired")
      when 9
        gif_options("frustrated")
      when 10
        gif_options("imposter")
      end
      second_menu
  end

  def second_menu#COMPLETE
    sleep 1
    what_next
    choice = user_input.to_i
    until choice != 0 && choice <= 7
      puts "please type a number 1-7"
      system("say", "please type a number 1 through 7")
      choice = user_input.to_i
    end
    case choice
      when 1#working
        main_menu
      when 2#working
        update_mood
        second_menu
      when 3#working
          puts "your feelings are valid! DON'T DELETE!"
          system("say", "your feelings are valid! Don't delete!")
          sleep 1
          puts "if you still want to delete type yes"
          input = user_input
          if input == "yes"
            prompt = TTY::Prompt.new
            prompt.select (puts "Which mood would you like to delete?") do |menu|
            menu.choice 'the last one', -> {@name.delete_mood}
            menu.choice 'all of them', -> {@name.delete_all_moods}
          end
            second_menu
          else
            puts "Whew! Good choice."
            system("say", "Whew! good choice")
            second_menu
          end
      when 4#working
        @name.list_moods
        second_menu
      when 5#working
        Mood.list_all
        second_menu
      when 6#working
        rate_the_app
        second_menu
      when 7#working
        system("say", "Thank you for using Insta mood! Have a good day!")
        avg = get_average
        puts "Instamood has #{avg} stars" #INSERT AVERAGE METHOD FOR RATING HERE
        abort("Thank you for using Instamood! Have a good day!")
      end
  end


######################## HELPER METHODS ######################

  def hru#COMPLETE
    puts "How are you feeling?"
    system("say", "how are you feeling?")
    sleep 1
    puts <<-end
    1. Happy
    2. Sad
    3. Flirty
    4. Angry
    5. Excited
    6. Calm
    7. Hangry
    8. Tired
    9. Frustrated
    10. Like an Imposter
    end
    sleep 1
    puts "Please choose a number"
  end


  def what_next#COMPLETE
    puts "what would you like to do next?"
    system("say", "what would you like to do next?")
    sleep 1
    puts <<-end
    1. create a new mood
    2. edit a mood
    3. delete my moods
    4. view my moods
    5. view all moods
    6. rate the app :)
    7. exit Instamood :(
    end
    puts "please choose a number"
  end

  def gif_options(category)#COMPLETE
    gif = Gif.where("category = '#{category}'")#find active record method for this where query
    user_choice = gif.sample
    system('open', "#{user_choice.url}")#should open the returned url in the browser
    system("say", "is this how you feel?")
    sleep 1
    puts "type 'yes' to keep this gif or 'no' for another option"
    input = user_input
    until input == "yes"
      if input == "no"
        user_choice = gif.sample
        system('open', "#{user_choice.url}")
        sleep 1
        puts "yes or no"
        system("say", "how about this one?")
        input = user_input
      else
        sleep 1
        puts "please type yes or no"
        system("say", "please type yes or no")
        input = user_input
      end
    end
    save_mood(user_choice, @name)
    return
  end

  def save_mood(gif, user)#SHOW WHAT THEY'VE SAVED
    sleep 1
    puts "Enter your caption"
    caption = gets.chomp
    system("say", "your caption is. #{caption}")
    mood = Mood.create(
      gif_id: gif.id,
      user_id: user.id,
      caption: caption
    )
  end

  def update_mood
    system("say", "which mood would you like to edit")
    prompt = TTY::Prompt.new
    prompt.select("which mood would you like to edit?") do |menu|
      menu.choice 'the last one', -> {@name.update_last_mood}
      menu.choice 'enter mood id', -> {@name.update_mood_by_id}
    end
  end

##################### BASIC HELPER METHODS ####################

  def user_input#COMPLETE
    gets.chomp.downcase
  end

  def create_user(name)#COMPLETE
    User.create(
      name: name
    )
  end
  ##################### STRETCH METHODS ####################

  def rate_the_app#COMPLETE
    prompt = TTY::Prompt.new
    prompt.select("How was your Instamood experience? Please select 1-5 (5 being AWESOME; 1 being HORRIBLE") do |menu|
      menu.choice '1', -> { puts 'Way harsh, Tai.', Rating.create(user_id: @name.id, number: 1)
                            system("say", "way harsh Tai!")}
      menu.choice '2', -> { puts 'Sounds like a personal problem.', Rating.create(user_id: @name.id, number: 2)
                            system("say", "Sounds like a personal problem.")}
      menu.choice '3', -> { puts 'We think you meant to select 5', Rating.create(user_id: @name.id, number: 3)
                            system("say", "I think you meant to select five")}
      menu.choice '4', -> { puts "We'll take it.", Rating.create(user_id: @name.id, number: 4)
                            system("say", "We'll take it!")}
      menu.choice '5', -> { puts "Thanks for your feedback! We're happy you're happy with Instamood.", Rating.create(user_id: @name.id, number: 5)
                            system("say", "Thanks for your feedback! We're happy you're happy with Insta mood!")}
    end
    puts ""
  end

  def get_average#COMPLETE
    Rating.app_average
  end

end
