PokemonBuilder builder = new PokemonBuilder("Pikachu")
    .addAttack(new Attack("Volt Tackle")
    .addAttack(new Attack("Thunder Wave")
    .addAttack(new Attack("Thunder Shock")
    .addAttack(new Attack("Thunderbolt")
    .setMaxHP(274)
    .setHeight(0.4)
    .setWeight(6.0);
Pokemon pikachu = builder.build();