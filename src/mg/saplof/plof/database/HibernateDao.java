package mg.saplof.plof.database;

import mg.saplof.plof.model.percistence.DataObject;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.HibernateException;
import org.hibernate.criterion.Example;
import javax.persistence.Query;

import java.util.List;

public class HibernateDao {
    private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

    public SessionFactory getSessionFactory() {
      return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
      this.sessionFactory = sessionFactory;
    }
    public void save() throws HibernateException{

      Session session = null;
      Transaction tr=null;
      try{
        session = getSessionFactory().openSession();
        tr=session.beginTransaction();
        session.save(this);
        tr.commit();
      }catch (Exception ex){
        if(tr!=null)
          tr.rollback();
        throw ex;
      }finally {
        if(session!=null)
          session.close();
      }
    }

    /*public void findById() throws Exception{
        Session session = null;
        try{
            session = getSessionFactory().openSession();
            session.load(this,this.getId());
        }catch (Exception ex){
            throw ex;
        }finally {
            if(session!=null)
                session.close();
        }
    }*/

    public List<DataObject> findAll() throws HibernateException{
      Session session = null;
      try{
        session = getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(this.getClass());
        criteria.add( Example.create(this) );
        return criteria.list();
      }catch (Exception ex){
        throw ex;
      }finally {
        if(session!=null)
          session.close();
      }
    }

    public Integer countAll() throws HibernateException{
      return findAll().size();
    }
}
