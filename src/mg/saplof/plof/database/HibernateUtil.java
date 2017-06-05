package mg.saplof.plof.database;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;

public class HibernateUtil
{
    private static SessionFactory sessionFactory;
    private static ServiceRegistry serviceRegistry;
    private static String hibernateCfgUrl = "/mg/saplof/plof/database/mapping_files/hibernate.cfg.xml";

    private static SessionFactory buildSessionFactory() {
      StandardServiceRegistry standardRegistry = null;
      try{
        standardRegistry = new StandardServiceRegistryBuilder()
          .configure(hibernateCfgUrl).build();

        Metadata metaData = new MetadataSources(standardRegistry)
          .getMetadataBuilder().build();

        return metaData.getSessionFactoryBuilder().build();
      } catch (HibernateException he){
        System.err.println("Error creating Session: " + he);
        StandardServiceRegistryBuilder.destroy( standardRegistry );
        throw new ExceptionInInitializerError(he);
      }
    }

    static
    {
        try {
          sessionFactory = buildSessionFactory();
        } catch (HibernateException he) {
          throw new ExceptionInInitializerError(he);
        }

    }

    public static SessionFactory getSessionFactory(){
        return sessionFactory;
    }
}
