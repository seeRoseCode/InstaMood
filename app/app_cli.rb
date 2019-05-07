require 'pry'
class InstamoodRun

  def run
    welcome
    #puts a welcome
    #ask for user name
    main_menu
    #ask how they're feeling
    #display_gif_options
    #choose to keep/reject a gif

  end

  def welcome
    puts "Welcome to Instamood!"
    puts "Enter your Username"
    user_input
  end

  def main_menu
    hru#asks how they're feeling
    feeling = user_input.to_i
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
  end

  def hru
    puts "How are you feeling?"
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
    puts "Please choose a number"
  end


  def gif_options(category)
    gif = Gif.all.select{|gifs| gifs.category == category}
    # binding.pry
    puts gif.sample.url
    #pull random gif from gif table where category matches feeling
    puts "type 'keep' to keep this gif or 'reject' for another option"
    input = user_input
    if input == "keep"
      #save_mood
      puts "TEST STRING"
      return
    elsif
      while input == "reject"
        puts gif.sample.url
        puts "type 'keep' to keep this gif or 'reject' for another option"
        input = user_input
        if input == "reject"
          gif_options(category)
        elsif input == "keep"
          #save_mood
          puts "test string"
          return
      end
      end
    else
      puts "please enter keep or reject"
      gif_options(category)
    end
  end

  # def save_mood
  #   #once they choose to keep once
  #   #user_input_caption
  #   #save new Mood instance to the db
  # end



  # def  display_gif_options
  # end


  def user_input
    gets.chomp
  end

end
