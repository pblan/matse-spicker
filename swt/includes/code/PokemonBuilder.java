class PokemonBuilder {
    public String name;
    public List<Attack> attacks = new ArrayList<Attack>();
    public int maxHP;
    public double height;
    public double weight;
    // more attributes ...

    public PokemonBuilder(String name) {
        this.name = name;
    }

    public PokemonBuilder addAttack(Attack attack) {
        this.attacks.add(attack);
        return this;
    }

    public PokemonBuilder setMaxHP(int maxHP) {
        this.maxHP = maxHP;
        return this;
    }

    public PokemonBuilder setHeight(double height) {
        this.height = height;
        return this;
    }

    public PokemonBuilder setWeight(double weight) {
        this.weight = weight;
        return this;
    }

    // etc.

    public Pokemon build() {
        Pokemon pokemon = new Pokemon(name);
        pokemon.attacks = this.attacks;
        pokemon.maxHP = this.maxHP;
        pokemon.height = this.height;
        pokemon.weight = this.weight;
        // etc.

        return pokemon;
    }
}