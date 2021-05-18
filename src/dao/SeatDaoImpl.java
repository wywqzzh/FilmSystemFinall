package dao;

import beans.Seat;
import org.hibernate.SessionFactory;

import java.util.List;

public class SeatDaoImpl implements ISeatDao{
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Seat> selectSeatByArrangeId(String arrangeId) {
        String hql="from Seat where arrangeId=:id";
        return sessionFactory.getCurrentSession().createQuery(hql).setParameter("id",arrangeId).list();
    }

    @Override
    public void insertSeat(Seat seat) {
        sessionFactory.getCurrentSession().save(seat);
    }

    @Override
    public Seat selectSeatByAll(Seat seat) {
        String hql="from Seat where arrangeId=:id and row=:row and col=:col";
        return (Seat) sessionFactory.getCurrentSession().createQuery(hql).setParameter("id",seat.getArrangeId()).setParameter("row",seat.getRow()).setParameter("col",seat.getCol()).uniqueResult();
    }

    @Override
    public void deleteSeat(Seat seat) {
        sessionFactory.getCurrentSession().delete(seat);
    }
}
