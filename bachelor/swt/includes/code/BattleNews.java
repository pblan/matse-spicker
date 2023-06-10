class BattleNews {
    protected String title;

    public BattleNews(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }
}

class Trainer implements Observer {
    protected String name;

    public Trainer(String name) {
        this.name = name;
    }

    public void onNewsPosted(BattleNews news) {
        System.out.println(name + ": " + news.getTitle());
    }
}