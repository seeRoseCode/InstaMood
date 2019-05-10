CLI APPLICATION

APP TITLE - "INSTAMOOD"

DESCRIPTION
Instamood is a CLI application that allows its users to document how they are feeling throughout the day with a gif and caption that they feel best represents them in that moment. Users can create a simple profile accessed via their chosen username.

USER STORIES
1. Users are able to create a simple profile by entering their chosen username upon first initiation of the app. When returning to the app, the app will recognize that username.
2. Users are able to track their "mood" throughout the day by entering how they're feeling, choosing a corresponding gif from the options available, and adding a caption for that gif.
3.	Users can save each mood they create and retrieve them later using the id generated for each mood.
4. Users can delete previous moods they've created using the mood's id number OR  delete all previous moods created.
5. Users can update the caption on previous moods they've created using the mood's id number.
6.	Users can view all of the moods they've created along with their id numbers and corresponding captions.
7. Users can view all moods posted to the app including those by other users in a "timeline"


STRETCH GOALS
1. User can see moods posted by a particular user.
2. User can like their  moods or the moods of others
<!-- 3. User is able to rate their experience with Instamood.#COMPLETED -->
<!-- 4. Instamood is able to store and display all ratings from users. -->
<!-- 5. #average_ratings is able to produce an average of all user  ratings that updates whenever new ratings are entered. -->


APP_CLI METHODS
1. #welcome
    Greets the user. Asks for the user's username and acknowledges users that are returning to the app. If this is the user's first experience with Instamood, it creates a user instance using their input as a argument. This user instance is saved to the database.
2.  #hru (abbreviation - "how are you")
    Helper method that asks they user how they're feeling and displays 10 different emotion options. Prompts the user to make a choice.
3. #main_menu
    Takes the input from #hru and uses it to run #gif_options(see below). Ensures that the input provided by the user can be converted to an integer between 1 and 10.
4.  #what_next
    A helper method that asks the user what they would like to do next and presents them with options to choose from.
5. #second_menu
    Runs the #what_next helper method. Based on user input runs the following methods: #main_menu, #update_mood, #delete_moods, #list_moods, Mood.list_all, #rate_the_app, #exit. Uses recursion to return to this menu after each method ends except #exit. When user opts to exit the app, runs #abort to exit the program.
    #gif_options
    Pulls a random gif from the category, and displays that URL to the terminal. Should automatically open the link in Chrome.
    Asks user if they want to keep or reject the gif. If they type 'yes', they move on to #save_mood.
    If they type 'no', another random gif is displayed. This will continue until they type 'yes'.
7. #save_mood
    Once the user selects a gif, they are prompted to type in a caption. A new mood is created that captures the gif_id, user_id, and caption.
8. #user_input
    Gets input to the terminal from the user and removes any additional spaces/lines. downcases that input to account for variations in user inputs. Helper method.
9. #create_user(name)
    Creates a new user with a name. Helper method.


USER METHODS
1. #list_moods
    Lists all the moods that belong to the current user instance.
2. #retrieve_mood(1)
    Helper method that takes in an argument of a mood id number and returns the mood instance that matches it.
3. #retrieve_last_mood
    Helper method that queries the database for the last mood created by the current user instance.
4. #update_last_mood
    Allows the user to update the caption of the last mood they created.
5. #update_mood_by_id
    Takes in an argument of a mood id and uses #retrieve_mood to allow the user to find that mood instance and update its caption.
6. #delete_mood
    uses #retrieve_last_mood to allow the user to find the last mood they created and delete it.
7. #delete_all_moods
    deletes all moods created by the current user instance.
8. #user_input
    gets input from the user and downcases it to account for input variety

MOOD METHODS
1. .list_all
    class method that lists all mood instances that have been created formatted by id number, url, and caption.

TITLE METHODS
1. #.title
    A way to get ASCII art into the file. Puts INSTAMOOD.

RATING METHOD
1. #.app_average
    Takes all of the ratings and averages them.    
    

BUGS WE COULDN'T GET RID OF
1.  When generating a GIF for the user via #gif_options, we were unable to figure out how to generate a random gif without repeating previous options until all options were shown. The problem is most likely due to the sample size being so small. Each GIF category only has 5 GIFs to sample from making it more likely to see repeats than if we were pulling from the actual GIPHY API where we found them. In the interest of time, we opted to focus on fixing other bugs.
2. When the user opts to delete their mood, the application doesn't acknowledge the deleted object immediately. We are unsure of what causes the delay or how long it lasts. Results vary from attempt to attempt. Sometimes the database is not updated until the program is terminated and sometimes it updates when trying to run the update mood methods by raising an error saying that the GIF is not available to update.
3. When the user rates the app, it returns the Rating instance to the command line. We were both unsure of why it was doing that and unsure of how to fix it. In the interest of time, we opted to focus on fixing other bugs.
