package mg.saplof.plof.model.authentification;

import mg.saplof.plof.model.percistence.Authentificable;
import java.security.MessageDigest;
import java.math.BigInteger;

public abstract class Model{
  /*public static Authentificable login(Authentificable object) {
    return object.login();
  }
  public static boolean logout(Authentificable object) {
    return object.logout();
  }*/
  public static String getHashMd5(String toHash) throws Exception {
    byte[] bytesOfMessage = toHash.getBytes("UTF-8");
    MessageDigest md = MessageDigest.getInstance("MD5");
    md.reset();
    md.update(bytesOfMessage);
    byte[] digest = md.digest();

    BigInteger bigInt = new BigInteger(1, digest);

    String hashText = bigInt.toString(16);
    while (hashText.length() < 32) {
      hashText = "0"+hashText;
    }

    return hashText;
  }
}
