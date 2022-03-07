PokemonCenter pokemonCenter = new PokemonCenter();
Nurse joy = new Nurse(pokemonCenter);

Trainer ash = new Trainer("Ash");
Pokemon pikachu = new Pokemon("Pikachu");

joy.healPokemon(pikachu, ash);
// PokemonCenter: received Pikachu from Ash
// PokemonCenter: Pikachu has been taken out of the Pokeball.
// PokemonCenter: Pikachu has been healed.
// PokemonCenter: Pikachu has been put in the Pokeball.
// PokemonCenter: Pikachu has been given to Ash.