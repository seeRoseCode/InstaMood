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
8. Users can rate their experience with Instamood on a scale of 1-5.

METHODS THAT AREN'T FUNCTIONAL AS YET
1. user can rate the app
2. user can like other people's moods


STRETCH GOALS
1. see their friend’s moods
#2.	Ask if the user would like to post a mood or see the posts of others.
#5.	If user selects see the posts of others, lists out all previous mood posts
    - Give user option to like those posts
6.	User is able to rate their experience store all ratings.
7.	average all ratings and print average to the console




APP_CLI METHODS
1. #welcome
    Greets the user. Asks for the user's username and acknowledges users that are returning to the app. If this is the user's first experience with Instamood, it creates a user instance using their input as a argument.
2.  #main_menu
3. second_menu
    #ask what they want to do next
    #update_mood
    #delete_moods
    #see moods of other users
    #rate_the_app
    #exit the app
4. hru
5. what_next
