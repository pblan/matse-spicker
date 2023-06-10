interface ContestPokemon {
    public String getDescription();
}

class BasePokemon implements ContestPokemon {
    public String getDescription() {
        return "Base Pokemon";
    }
}

abstract class ContestPokemonDecorator implements ContestPokemon {
    protected ContestPokemon pokemon;

    public ContestPokemonDecorator(ContestPokemon pokemon) {
        this.pokemon = pokemon;
    }

    public String getDescription() {
        return this.pokemon.getDescription();
    }
}

class SunglassesPokemonDecorator extends ContestPokemonDecorator {
    public SunglassesPokemonDecorator(ContestPokemon pokemon) {
        super(pokemon);
    }

    public String getDescription() {
        return super.getDescription() + " with sunglasses";
    }
}

class HatPokemonDecorator extends ContestPokemonDecorator {
    public HatPokemonDecorator(ContestPokemon pokemon) {
        super(pokemon);
    }

    public String getDescription() {
        return super.getDescription() + " with a hat";
    }
}