
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

75.times do
    trainer_team = ""
    6.times do
        trainer_pokemon = PokeApi.get(pokemon: rand(1..385)).name.capitalize()
        trainer_team = "#{trainer_team} #{trainer_pokemon}"
    end

    puts trainer_team

    trainer = Trainer.create(
        name: Faker::Name.name,
        region_id: rand(0..7),
        trainer_pokemon: trainer_team,
        age: rand(10..50),
        gender: Faker::Gender.binary_type)


    trainer.errors.messages.each do |attribute, error|
        puts "#{attribute} #{error}"
    end
    #puts trainer.name
end

puts "Created #{Trainer.count} trainers."

for i in 1..385
    pokemon = PokeApi.get(pokemon: i)
    #puts pokemon.name
    description = ""
    PokeApi.get(pokemon_species: pokemon.name).flavor_text_entries.find do |text|
        if text.language.name == "en"
        description = text.flavor_text
        end
    end

    pokedex = description.gsub("\n", " ").gsub("\f", " ")

    pokemon = Pokemon.create(
        name: pokemon.name.capitalize(),
        pokemon_type: pokemon.types[0].type.name.capitalize(),
        region_id: rand(0..7),
        pokemon_front: pokemon.sprites.front_default,
        pokemon_back: pokemon.sprites.back_default,
        description: pokedex)
    pokemon.errors.messages.each do |attribute, error|
        puts "#{attribute} #{error}"
    end
end

#Gets a specific pokemon by ID.
#pokemons = PokeApi.get(pokemon: 1)
#puts pokemons.name

puts "Created #{Pokemon.count} pokemon."
