ContestPokemon pikachu = new BasePokemon();
pikachu = new SunglassesPokemonDecorator(pikachu);
pikachu = new HatPokemonDecorator(pikachu);

System.out.println(pikachu.getDescription()); // Base Pokemon with sunglasses with a hat