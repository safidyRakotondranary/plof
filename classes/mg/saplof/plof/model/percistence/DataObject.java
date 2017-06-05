package mg.saplof.plof.model.percistence;

import mg.saplof.plof.database.HibernateDao;

public class DataObject extends HibernateDao{
  protected Integer id;

  public void setId(Integer id) {
    this.id = id;
  }
  public Integer getId() {
    return id;
  }
}
