PokemonLeague indigoLeague = new PokemonLeague();

indigoLeague.setChampion(new Trainer("Blue"));

List<Trainer> eliteFour = new ArrayList<Trainer>();
eliteFour.add(new Trainer("Lorelei"));
eliteFour.add(new Trainer("Bruno"));
eliteFour.add(new Trainer("Agatha"));
eliteFour.add(new Trainer("Lance"));
indigoLeague.setEliteFour(eliteFour);

List<Trainer> gymLeaders = new ArrayList<Trainer>();
gymLeaders.add(new Trainer("Brock"));
gymLeaders.add(new Trainer("Misty"));
gymLeaders.add(new Trainer("Lt. Surge"));
gymLeaders.add(new Trainer("Erika"));
gymLeaders.add(new Trainer("Koga"));
gymLeaders.add(new Trainer("Sabrina"));
gymLeaders.add(new Trainer("Blaine"));
gymLeaders.add(new Trainer("Giovanni"));
indigoLeague.setGymLeaders(gymLeaders);
