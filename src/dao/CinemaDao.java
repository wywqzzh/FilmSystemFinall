package dao;

import beans.Cinema;
import beans.User;
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

    @Override
    public void insertCinema(Cinema cinema) {
        sessionFactory.getCurrentSession().save(cinema);
    }

    @Override
    public List<Cinema> selectCinemaByName(String name) {
        String hql="from Cinema where cinemaName=:name";
        return sessionFactory.getCurrentSession().createQuery(hql).setParameter("name",name).list();
    }

    @Override
    public void updateCinema(Cinema cinema) {
        String hql="update Cinema set cinemaName=:name,cinemaAddress=:address,cinemaphone=:phone where cinemaId=:id";
        sessionFactory.getCurrentSession().createQuery(hql).
        setParameter("name",cinema.getCinemaName()).
        setParameter("address",cinema.getCinemaAddress()).
        setParameter("phone",cinema.getCinemaphone()).
        setParameter("id",cinema.getCinemaId()).executeUpdate();
        sessionFactory.getCurrentSession().clear();
    }
}
