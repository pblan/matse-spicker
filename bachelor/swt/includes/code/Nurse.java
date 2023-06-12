public class Nurse {
    protected PokemonCenter pokemonCenter;

    public Nurse(PokemonCenter pokemonCenter) {
        this.pokemonCenter = pokemonCenter;
    }

    public void healPokemon(Pokemon pokemon, Trainer trainer) {
        pokemonCenter.receivePokemonInPokeball(pokemon, trainer);
        pokemonCenter.takePokemonOutOfPokeball(pokemon);
        pokemonCenter.healPokemon(pokemon);
        pokemonCenter.putPokemonInPokeball(pokemon);
        pokemonCenter.givePokemonToTrainer(pokemon, trainer);
    }
}
