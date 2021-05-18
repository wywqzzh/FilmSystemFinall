package dao;

import beans.Hall;
import org.hibernate.SessionFactory;

import java.util.List;

public class HallDaoImpl implements IHallDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    @Override
    public void insertHall(Hall hall) {
        sessionFactory.getCurrentSession().save(hall);
    }

    @Override
    public List<Hall> selectAllHallByCinemaId(String cinemaId) {
        String hql="from Hall where cinemaId=:id";
        return sessionFactory.getCurrentSession().createQuery(hql).setParameter("id",cinemaId).list();
    }

    @Override
    public void deleteHallById(String Id) {
        String hql="delete from Hall where hallId=:id";
//        外键约束
        sessionFactory.getCurrentSession().createQuery(hql).setParameter("id",Id).executeUpdate();
        sessionFactory.getCurrentSession().clear();
    }

    @Override
    public Hall selectHallByCinemaIdAndNum(String cinemaId, int num) {
        String hql="from Hall where cinemaId=:id and hallNum=:num";
        return (Hall) sessionFactory.getCurrentSession().createQuery(hql).setParameter("id",cinemaId).setParameter("num",num).uniqueResult();
    }
}
