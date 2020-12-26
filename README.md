## iTV

### Project requirements

Our application has movies, seasons and episodes. Movies and episodes only have a title and a plot, and seasons have title, plot and a number. An episode belongs to a season and a season can have N episodes, the episode also has the number of episode in the season.

Movies and seasons can be rent (but not episodes), each one can have several purchase options, a purchase option has a price (2.99) and a video quality (HD or SD).

We also have users, to simplify, a user will only have an email.

A user can make a rental of a content (movie/season) through a purchase option. When a user makes a rental, we store it in his library, the user has up to 2 days to see the content. In his library, we only show the titles that the user has "alive" and he can see and not the expired rentals. Also, while the user has a content in his library, he can't rent the same content again.

For instance, if the user rents the movie '300: Rise of an Empire' and goes to his library, he will find the movie. If he tries to rent it again, he will receive an error. 3 days after, if he goes to the library, the movie will not appear in his library and he can rent it again.

**There is no need to implement authentication nor authorization**. Suppose that the user is already registered and authenticated, you can identify the user in each request by a parameter like user_id.

Define and implement the following JSON REST API in Ruby:

- An endpoint to return the movies, ordered by creation.
- An endpoint to return the seasons ordered by creation, including the list of episodes ordered by its number.
- An endpoint for a user to perform a rental of a content.
- An endpoint to get the library of a user ordered by the remaining time to watch the content.

### Developer notes

#### To use or not to use STI?, this is the question.

If I don't use STI, I won't have unnecessary `null`'s in database, but I'll have identical 2 long string fields in 3 different tables (title and plot).

If I use STI, I have two options:

- The first one uses one table but stores `null`'s in two fields.
- And the second one do not stores `null`'s but needs two associated tables, one for the field "number" of episodes and seasons, and another to store the relation between episodes and seaons.

What I have done is use STI with only one table, instead of creating 2 more tables just for 1 field for each.

## Requirements

- Ruby 2.5.8
- Rails 6.1
- MySQL 5.6

## Database creation / initialization

You can create a `.env` file to set up these environment variables for the database credentials:

- DATABASE_NAME
- DATABASE_HOST
- DATABASE_PORT
- DATABASE_USER
- DATABASE_PASSWORD

or, otherwise these are the credentials that will be used

```yaml
database: iTV_devel/iTV_test
host:     127.0.0.1
port:     3306
username: root
```

To set up the database run:

```
bundle exec rails db:create
bundle exec rails db:migrate
```

The file `db/seeds.rb` contains some data examples that you can use running `bundle exec rails db:seed`.

## Testing

Execute `bundle exec rspec` within the project folder, and the output result should be:

```
Finished in 3.83 seconds (files took 1.33 seconds to load)
80 examples, 0 failures
```

