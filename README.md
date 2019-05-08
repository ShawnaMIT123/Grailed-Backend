Code Challenge

Premise

In the spirit of investing in our community, we've decided to support pretty URLs for user profiles (e.g., grailed.com/god). Unfortunately there are two problems: we forgot to make usernames unique (doh!), and some users have usernames that we want to disallow such as privacy, grailed, about, etc..

#### ALL FUNCTIONS CAN BE FOUND AT THE app/models/user.rb PATH #####
Exercise
#### DB RESET: RUN rake db:reset #####

Given the SQLite database found here, please complete the following:
1 - Write a function that finds all users with disallowed usernames. Disallowed usernames can be found in the `disallowed_usernames` table.

#### RUN User.find_all_disallowed_users #######

2- Write a function that resolves all username collisions. E.g., two users with the username `foo` should become `foo` and `foo1`. The function accepts an optional "dry run" argument that will print the affected rows to the console, not commit the changes to the db.

#### DRYRUN: RUN User.update_duplicate_usernames("dry run") #######
#### DB UPDATE: RUN User.update_duplicate_usernames        #######


3- Write a function that resolves all disallowed usernames. E.g., `grailed` becomes `grailed1`. The function accepts an optional "dry run" argument that will print the affected rows to the console, not commit the changes to the db.

#### DRYRUN: RUN User.resolve_disallowed_usernames("dry run") #######
#### DB UPDATE: RUN User.resolve_disallowed_usernames         #######

The expected deliverable is one or more files that fulfill the spec. It does not have to be a fully fledged application.

Once completed, please send us a zip, or a link to the GitHub repo, and include a README that documents how to use the interface, as part of your submission.

Notes

We're looking to use this example as a way to understand how you think about writing software. In particular we're looking for:
Whether the example works in the way we described.
How you think about ensuring your code works properly.
How you think about structure and design.
Code cleanliness, naming, and style.
Technical prowess (i.e., a scaffolded Rails app may not always be the best way to portray your abilities).
Feel free to use whatever language or framework you like, but please mention in your README how much experience you have with the technical stack you choose. We will take note of that when reviewing your challenge.

########## MY WORK ############################
Ruby on Rails (1 year experience)/SQL (5 years experience) 
1) I attached the SQLite database to a newly created rails application.
  - rails new grailed
  - updated the development database in the config/database.yml

2) Utilized the seed dump gem to generate a seed file of the provided database to allow for easy database reset to its initial state.

3) Created the model files for the two database tables: users and disallowed_usernames
  - app/models/disallowed_username.rb
  - app/models/user.rb (ALL FUNCTIONS CAN BE FOUND)

################################################

Here are some technologies we are more familiar with:
Ruby
JavaScript
Python
Java
If you choose to use a framework that results in boilerplate code in the repository, please detail in your README which code was written by you (as opposed to generated code).

Again, let us know if you have any questions!
