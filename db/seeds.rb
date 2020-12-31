# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

# Are you sure?
Purchase.delete_all
PurchaseOption.delete_all
Episode.delete_all
Season.delete_all
Movie.delete_all
User.delete_all

user = User.create!(email:'ruby_test@gmail.com')

# Movies

movie1 = Movie.create!(title: 'Monsters inc', plot: 'Family')
po11 = movie1.purchase_options.create!(video_quality: 'SD', price: 3.99)
po12 = movie1.purchase_options.create!(video_quality: 'HD', price: 4.99)

movie2 = Movie.create!(title: 'Mr. Bean', plot: 'Commedy')
po21 = movie2.purchase_options.create!(video_quality: 'SD', price: 4)
po22 = movie2.purchase_options.create!(video_quality: 'HD', price: 5)

movie3 = Movie.create!(title: 'The Hobbit - the return', plot: 'Adventures')
movie3.purchase_options.create!(video_quality: 'SD', price: 4.99)
movie3.purchase_options.create!(video_quality: 'HD', price: 5.99)

# Season 1
season = Season.create!(title: 'The Hobbit', plot: 'Adventures', number: 1)
season.episodes.create(title: 'An Unexpected Journey',
                       plot: 'Adventures',
                       number: 1)
season.episodes.create(title: 'The Desolation of Smaug',
                       plot: 'Adventures',
                       number: 2)
season.episodes.create(title: 'The Battle of the Five Armies',
                       plot: 'Action',
                       number: 3)

season.purchase_options.create!(video_quality: 'SD', price: 2.99)
season.purchase_options.create!(video_quality: 'HD', price: 4.99)

# Season 2
season2 = Season.create!(title: 'Superman', plot: 'Family', number: 2)
season2.episodes.create!(title: 'The beginning', plot: 'Drama', number: 1)
season2.episodes.create!(title: 'Supper returns', plot: 'Action', number: 2)

season2.purchase_options.create!(video_quality: 'HD', price: 3.99)

# Purchase

user.purchases.create!(purchase_option: po11)
user.purchases.create!(purchase_option: po22)
