# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app

  - Used Sinatra to build the app.


- [x] Use ActiveRecord for storing information in a database

  - Used ActiveRecord to store information in a database.


- [x] Include more than one model class (list of model class names e.g. User, Post, Category)

  - We have Users, Tasks, and 7 Day objects. Since many tasks have many days and vice versa, there is a join table called DayTasks. So we have DayTasks as well.


- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)

  - Users have many Tasks. Day has many Tasks. Task has many Days.


- [x] Include user accounts

  - You can signup, log in, and sign out.


- [x] Ensure that users can't modify content created by other users

  - If someone is signed in, there isn't a way to edit another users account info or tasks, whether by using the app's buttons, or by directly inputting a URL.


- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying

  - |/tasks/new| |/tasks |or| /users/:slug/tasks/:day |or| /tasks/id/:id| |/tasks/id/:id/edit| |/tasks/id/:id/delete|


- [x] Include user input validations

  - |email address format, presence of certain attributes for both User and Task|


- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)

  - Anything that may bounce back leaves a <h2> at the top of the page with a somewhat descriptive message to the user.


- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

  - It indeed does.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [90%] You don't include changes in a commit that aren't related to the commit message
