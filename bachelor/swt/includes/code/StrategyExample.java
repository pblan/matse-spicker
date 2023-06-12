Pokemon pokemon = new Pokemon("Pikachu");

Ball pokeball = new Ball(new PokeBallCatchStrategy());
if (pokeball.catchPokemon(pokemon)) {
    System.out.println("Caught " + pokemon.getName());
}

Ball masterball = new Ball(new MasterBallStrategy());
if (masterball.catchPokemon(pokemon)) {
    System.out.println("Caught " + pokemon.getName());
}