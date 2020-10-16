require 'poke-api-v2'

Trainer.delete_all
Pokemon.delete_all

#20 regions (0-19)

50.times do
    trainer = Trainer.create(
        name: Faker::Name.name, 
        region_id: rand(0..7), 
        trainer_pokemon: PokeApi.get(pokemon: rand(1..450)).name.capitalize())
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


