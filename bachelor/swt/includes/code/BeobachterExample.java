Trainer ash = new Trainer("Ash");
Trainer misty = new Trainer("Misty");

NewsChannel channel = new NewsChannel();
channel.addObserver(ash);
channel.addObserver(misty);

channel.postNews(new BattleNews("Pikachu fainted!"));