public abstract class Gym {
    private List<Trainer> trainers = new ArrayList<Trainer>();

    // factory method
    public abstract Trainer createTrainer();

    protected Gym(int capacity) {
        for (int i = 0; i < capacity; i++) {
            trainers.add(createTrainer());
        }
    }
}

class WaterGym extends Gym {
    protected WaterGym(int capacity) {
        super(capacity);
    }

    public Trainer createTrainer() {
        return new WaterTrainer();
    }
}

class FireGym extends Gym {
    protected FireGym(int capacity) {
        super(capacity);
    }

    public Trainer createTrainer() {
        return new FireTrainer();
    }
}