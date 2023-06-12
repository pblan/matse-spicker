public class Pokemon {
    protected String name = "";
    protected List<Attack> attacks = new ArrayList<Attack>();
    protected int maxHP;
    protected double height;
    protected double weight;
    // more attributes ...

    public Pokemon(String name) {
        this.name = name;
    }

    // getters and setters ...
}
