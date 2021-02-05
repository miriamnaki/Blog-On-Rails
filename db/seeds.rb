# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PASSWORD = "supersecret"

Post.delete_all
Comment.delete_all
User.delete_all

super_user = User.create(
  name: "bill",
  email: "bill@ted.adventure",
  password: PASSWORD,
  is_admin: true
)

10.times do
  name = Faker::Name.first_name
  User.create(
    name: name,
    email: "#{name.downcase}@example.com",
    password: PASSWORD,
    is_admin: false
  )
end

users = User.all


20.times do
    created_at = Faker::Date.backward(days: 100)
    p = Post.create(
        title: Faker::Quote.famous_last_words,
        body: Faker::ChuckNorris.fact + Faker::ChuckNorris.fact,
        created_at: created_at,
        updated_at: created_at,
        user: users.sample
    )
    if p.valid?
      p.comments = rand(0..10).times.map do
        comment_date = Faker::Date.backward(days: 5)
        Comment.new(
          body: Faker::TvShows::StrangerThings.quote,
          created_at: comment_date,
          updated_at: comment_date,
          user: users.sample
        )
      end
    end
end

posts = Post.all

puts "Generated #{posts.count} posts"

puts "Generated #{Post.count} posts"
puts Cowsay.say("Generated #{Comment.count} comments", :tux)
puts Cowsay.say("Created #{users.count}, users", :tux)
puts "Login with #{super_user.email} and password of '#{PASSWORD}'"

