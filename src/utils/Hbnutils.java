package utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Hbnutils {
    private static SessionFactory sessionFactory;
    public static Session getSession(){
       return getSessionFactory().getCurrentSession();
    }
    public static SessionFactory getSessionFactory(){
        if(sessionFactory==null || sessionFactory.isClosed()) {
            sessionFactory = new Configuration().configure().buildSessionFactory();
        }
        return sessionFactory;
    }
}
