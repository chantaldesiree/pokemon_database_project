
require 'poke-api-v2'

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
        trainer_pokemon: PokeApi.get(pokemon: rand(1..450)).name.capitalize())


    trainer.errors.messages.each do |attribute, error|
        puts "#{attribute} #{error}"
    end
  # Will yield :name and "can't be blank"
    #puts "***********************************"
    #puts trainer.name
    #puts trainer.region_id
    #puts trainer.trainer_pokemon.capitalize()
end

puts "Created #{Trainer.count} trainers."

450.times do |i|
    pokemon = PokeApi.get(pokemon: pokemons = PokeApi.get(pokemon: i+1).name)

    pokemon = Pokemon.create(
        name: pokemon.name,
        pokemon_type: pokemon.types[0].type.name,
        region_id: rand(0..7))
    #puts pokemon.name
    #puts pokemon.pokemon_type
    #puts pokemon.regi
    #puts "*************************"
end

#Gets a specific pokemon by ID.
#pokemons = PokeApi.get(pokemon: 1)
#puts pokemons.name

puts "Created #{Pokemon.count} pokemon."
