interface CatchStrategy {
    public abstract boolean tryToCatch(Pokemon pokemon);
}

class PokeBallCatchStrategy implements CatchStrategy {
    public boolean tryToCatch(Pokemon pokemon) {
        System.out.println("Used Pokeball to catch " + pokemon.getName());
        return Math.random() < 0.1; // 10% chance of catching
    }
}

class MasterBallStrategy implements CatchStrategy {
    public boolean tryToCatch(Pokemon pokemon) {
        System.out.println("Used Masterball to catch " + pokemon.getName());
        return true; // 100% chance of catching
    }
}