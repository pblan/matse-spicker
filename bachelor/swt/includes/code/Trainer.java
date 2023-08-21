abstract class Trainer {
    protected String type;
}

class WaterTrainer extends Trainer {
    public WaterTrainer() {
        this.type = "Water";
    }
}

class FireTrainer extends Trainer {
    public FireTrainer() {
        this.type = "Fire";
    }
}
