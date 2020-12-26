### iTV

This application has movies, seasons and episodes. Movies and episodes only have a title and a plot, and seasons have title, plot and a number. An episode belongs to a season and a season can have N episodes, the episode also has the number of episode in the season.

Movies and seasons can be purchased (but not episodes), each one can have several purchase options, a purchase option has a price (2.99) and a video quality (HD or SD).

We also have users, to simplify, a user will only have an email.

A user can make a purchase of a content (movie/season) through a purchase option. When a user makes a purchase, we store it in his library, the user has up to 2 days to see the content. In his library, we only show the titles that the user has "alive" and he can see and not the expired purchases. Also, while the user has a content in his library, he can't purchase the same content again.

For instance, if the user purchases the movie '300: Rise of an Empire' and goes to his library, he will find the movie. If he tries to purchase it again, he will receive an error. 3 days after, if he goes to the library, the movie will not appear in his library and he can purchase it again.

Define and implement the following JSON REST API in Ruby:

- An endpoint to return the movies, ordered by creation.
- An endpoint to return the seasons ordered by creation, including the list of episodes ordered by its number.
- An endpoint to return both movies and seasons, ordered by creation.
- An endpoint for a user to perform a purchase of a content.
- An endpoint to get the library of a user ordered by the remaining time to watch the content.

Note: There is no need to implement authentication nor authorization. Suppose that the user is already registered and authenticated, you can identify the user in each request by a parameter like user_id.

### Requirements
- Ruby 2.5.6
- Rails 6.1
- MySQL 5.6

### Database creation / initialization

You can create a `.env` file to set up the database credentials, host and port:
  - DATABASE_NAME
  - DATABASE_HOST
  - DATABASE_PORT
  - DATABASE_USER
  - DATABASE_PASSWORD

or, otherwise these are the environment variables that will be used
```
database: getapp_devel/getapp_test
host:     127.0.0.1
port:     3306
username: root
```

To set up the database run:

```
bundle exec rails db:create
bundle exec rails db:migrate
```

The file `bundle exec db/seeds.rb` is filled with some examples.
So you can run `bundle exec rails db:seed` to populate the database with some examples

