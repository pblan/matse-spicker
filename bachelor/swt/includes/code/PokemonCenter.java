public class PokemonCenter {
    public void receivePokemonInPokeball(Pokemon pokemon, Trainer trainer) {
        System.out.println("PokemonCenter: received " + pokemon.getName() + " from " + trainer.getName());
    }

    public void takePokemonOutOfPokeball(Pokemon pokemon) {
        System.out.println("PokemonCenter: " + pokemon.getName() + " has been taken out of the Pokeball.");
    }

    public void healPokemon(Pokemon pokemon) {
        System.out.println("PokemonCenter: " + pokemon.getName() + " has been healed.");
    }

    public void putPokemonInPokeball(Pokemon pokemon) {
        System.out.println("PokemonCenter: " + pokemon.getName() + " has been put in the Pokeball.");
    }

    public void givePokemonToTrainer(Pokemon pokemon, Trainer trainer) {
        System.out.println("PokemonCenter: " + pokemon.getName() + " has been given to " + trainer.getName() + ".");
    }
}
