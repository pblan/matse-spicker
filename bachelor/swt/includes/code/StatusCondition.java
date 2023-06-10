interface StatusCondition {
    public void attack(BattlePokemon attacker, BattlePokemon defender);
}

class Burn implements StatusCondition {
    public void attack(BattlePokemon attacker, BattlePokemon defender) {
        int damage = attacker.getAttack() / 2; // attack is halved
        defender.setCurrentHP(defender.getCurrentHP() - damage);
        System.out.println(defender + " received " + damage + " damage!");

        System.out.println(attacker + " is burned!"); // attacker loses 1/16 of its max HP
        attacker.setCurrentHP(attacker.getCurrentHP() - attacker.getMaximumHP() / 16);
    }
}

class Sleep implements StatusCondition {
    public void attack(BattlePokemon attacker, BattlePokemon defender) {
        if (Math.random() < 0.2) { // chance of 20% to remove sleep
            System.out.println(attacker + " is no longer asleep!");
            attacker.setStatusEffect(null);

            int damage = attacker.getAttack(); // attacks after sleep is removed
            defender.setCurrentHP(defender.getCurrentHP() - damage);
            System.out.println(defender + " received " + damage + " damage!");
        } else {
            System.out.println(attacker + " is asleep!");
        }
    }
}