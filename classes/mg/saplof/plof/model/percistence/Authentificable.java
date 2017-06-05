package mg.saplof.plof.model.percistence;

public interface Authentificable{
  public abstract Personne login(Personne personne){}
  public abstract void logout(Personne personne){}
}
