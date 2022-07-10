puts 'Starting seeds...'
FactoryBot.find_definitions

puts '  Destroy all Drops'
Drop.destroy_all

puts '  Creating a Drop'
FactoryBot.create(:drop)

puts 'Seeds complete'.colorize(:green)
