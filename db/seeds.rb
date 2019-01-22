# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(first_name: "JK", last_name: "Rowling", email: "test@gmail.com", password: "password", user_type: "Author")
user2 = User.create(first_name: "joe", last_name: "moe", email: "test2@gmail.com", password: "password", user_type: "Reader")

20.times do
  book = Book.new(
    name:  Faker::Book.title,
    genre: Faker::Book.genre
  )
  book.user_id = user.id
  book.save
  user2.favorites << book
end

puts "#{Book.count} books in the system..."
