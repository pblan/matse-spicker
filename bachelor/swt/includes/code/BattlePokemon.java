public class BattlePokemon {
    StatusCondition statusCondition;
    // more attributes ...

    // constructors, getters and setters ...

    public void setStatusEffect(StatusCondition statusCondition) {
        this.statusCondition = statusCondition;
    }

    public void attack(BattlePokemon defender) {
        if (statusCondition != null) {
            statusCondition.attack(this, defender);
        } else {
            defender.setCurrentHP(defender.getCurrentHP() - this.attack);
        }
    }
}
