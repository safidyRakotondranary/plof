package mg.saplof.plof.model.percistence;

public interface Authentificable{
  public abstract Authentificable login() throws Exception;
  public abstract boolean logout() throws Exception;
}
