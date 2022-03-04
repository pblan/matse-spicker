class NewsChannel implements Observable {
    protected List<Observer> observers = new ArrayList<Observer>();

    public void addObserver(Observer observer) {
        observers.add(observer);
    }

    public void removeObserver(Observer observer) {
        observers.remove(observer);
    }

    public void notifyObservers(BattleNews news) {
        for (Observer observer : observers) {
            observer.onNewsPosted(news);
        }
    }

    public void postNews(BattleNews news) {
        notifyObservers(news);
    }
}