package dao;

import beans.Cinema;
import org.hibernate.SessionFactory;

import java.util.List;

public class CinemaDao implements ICinemaDao{
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Cinema> selectAllCinema() {
        String hql="from Cinema";
        return sessionFactory.getCurrentSession().createQuery(hql).list();
    }
}
