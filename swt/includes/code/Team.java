final class Team {
    private static Team instance;

    private Team() {
    }

    public static Team getInstance() {
        if (instance == null) {
            instance = new Team();
        }
        return instance;
    }
}