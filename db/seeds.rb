puts "Cleaning database first"
Movie.destroy_all

puts "Creating Movies..."
10.times do
  movie = Movie.new(
    title: Faker::Movie.title,
    overview: Faker::Movie.quote,
    rating: Faker::Number.within(range: 0.0..10.0).round(1),
    poster_url: "https://picsum.photos/seed/#{Faker::Movies::LordOfTheRings.character}/200/300"
  )
  movie.save!
end

puts "Movies created!"
