interface ContestPokemon {
    public String getDescription();
}

class BasePokemon implements ContestPokemon {
    public String getDescription() {
        return "Base Pokemon";
    }
}

class SunglassesPokemon implements ContestPokemon {
    protected ContestPokemon pokemon;

    public SunglassesPokemon(ContestPokemon pokemon) {
        this.pokemon = pokemon;
    }

    public String getDescription() {
        return this.pokemon + " with sunglasses";
    }
}

class HatPokemon implements ContestPokemon {
    protected ContestPokemon pokemon;

    public HatPokemon(ContestPokemon pokemon) {
        this.pokemon = pokemon;
    }

    public String getDescription() {
        return this.pokemon + " with a hat";
    }
}
