puts 'Starting seeds...'
puts '  Destroy all Drops'
Drop.destroy_all

puts '  Creating a Drop'
Drop.create!(
  description:Faker::Hacker.verb,
  content: Faker::Hacker.say_something_smart
)

puts 'Seeds complete'
