// Constructor: BattlePokemon(String name, int hp, int atk)
BattlePokemon pikachu = new BattlePokemon("Pikachu", 274, 229);
BattlePokemon charmander = new BattlePokemon("Charmander", 282, 223);
pikachu.setStatusEffect(new Burn());
charmander.setStatusEffect(new Sleep());

pikachu.attack(charmander); // Charmander received 114 damage! Pikachu is burned!
charmander.attack(pikachu); // Charmander is no longer asleep! Pikachu received 223 damage!
