class Ball {
    protected CatchStrategy catchStrategy;

    public Ball(CatchStrategy catchStrategy) {
        this.catchStrategy = catchStrategy;
    }

    public boolean catchPokemon(Pokemon pokemon) {
        return catchStrategy.tryToCatch(pokemon);
    }
}