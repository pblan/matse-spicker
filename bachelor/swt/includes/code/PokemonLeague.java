import java.util.ArrayList;
import java.util.List;

public class PokemonLeague {
    protected Trainer champion;
    protected List<Trainer> eliteFour;
    protected List<Trainer> gymLeaders;

    public void setChampion(Trainer champion) {
        this.champion = champion;
    }

    public void setEliteFour(List<Trainer> eliteFour) {
        if (eliteFour.size() == 4) {
            this.eliteFour = eliteFour;
        }
    }

    public void setGymLeaders(List<Trainer> gymLeaders) {
        if (gymLeaders.size() == 8) {
            this.gymLeaders = gymLeaders;
        }
    }
}
