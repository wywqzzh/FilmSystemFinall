package dao;

import beans.Hall;
import org.hibernate.SessionFactory;

public class HallDaoImpl implements IHallDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    @Override
    public void insertHall(Hall hall) {
        sessionFactory.getCurrentSession().save(hall);
    }
}
