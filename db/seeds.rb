
require 'poke-api-v2'

Region.delete_all
Trainer.delete_all
Pokemon.delete_all

#20 regions (0-19)
region = PokeApi.get(:region)
8.times do |i|
    Region.create(name: region.results[i].name)
end

puts "Created #{region.count} Regions"

50.times do
    trainer = Trainer.create(
        name: Faker::Name.name,
        region_id: rand(0..7),
        trainer_pokemon: PokeApi.get(pokemon: rand(1..811)).name.capitalize(),
        age: rand(10..50),
        gender: Faker::Gender.type)


    trainer.errors.messages.each do |attribute, error|
        puts "#{attribute} #{error}"
    end
    puts trainer.name
end

puts "Created #{Trainer.count} trainers."

for i in 1..811
    pokemon = PokeApi.get(pokemon: i)

    pokemon = Pokemon.create(
        name: pokemon.name.capitalize(),
        pokemon_type: pokemon.types[0].type.name,
        region_id: rand(0..7),
        pokemon_front: pokemon.sprites.front_default)
    pokemon.errors.messages.each do |attribute, error|
        puts "#{attribute} #{error}"
    end
    puts pokemon.name.capitalize()
end

#Gets a specific pokemon by ID.
#pokemons = PokeApi.get(pokemon: 1)
#puts pokemons.name

puts "Created #{Pokemon.count} pokemon."
