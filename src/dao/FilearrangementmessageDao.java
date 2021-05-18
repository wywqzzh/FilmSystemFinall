package dao;

import beans.Filearrangementmessage;
import org.hibernate.SessionFactory;

import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.util.List;

public class FilearrangementmessageDao implements IFilearrangementmessageDao{
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void insertArrange(Filearrangementmessage filearrangementmessage) {
        sessionFactory.getCurrentSession().save(filearrangementmessage);
    }

    @Override
    @Transactional
    public List<Filearrangementmessage> selectAByTime(Timestamp timestamp) {
        String hql="from Filearrangementmessage where arrangeStartDatetime<:time";
        return sessionFactory.getCurrentSession().createQuery(hql).setParameter("time",timestamp).list();
    }



    @Override
    public List<Filearrangementmessage> selectArrangeHot(Timestamp time) {
        String hql="from Filearrangementmessage where arrangeSaleTime<:time and arrangeStartDatetime>:time order by arrangeStartDatetime";
        return sessionFactory.getCurrentSession().createQuery(hql).setParameter("time",time).list();
    }

    @Override
    public List<Filearrangementmessage> selectArrangeWill(Timestamp time) {
        String hql="from Filearrangementmessage where arrangeSaleTime>:time order by arrangeSaleTime";
        return sessionFactory.getCurrentSession().createQuery(hql).setParameter("time",time).list();
    }

    @Override
    public List<Filearrangementmessage> selectArrangeByTimeFilmId(Timestamp timestamp, String filmId) {
        String hql="from Filearrangementmessage where arrangeSaleTime<:time and arrangeStartDatetime>:time  and filmId=:filmId order by arrangeStartDatetime";

        return sessionFactory.getCurrentSession().createQuery(hql).setParameter("time",timestamp).setParameter("filmId",filmId).list();
    }

    @Override
    public Filearrangementmessage selectArrangeById(String arrangeId) {
        String hql="from Filearrangementmessage where arrangeId=:id";
        return (Filearrangementmessage) sessionFactory.getCurrentSession().createQuery(hql).setParameter("id",arrangeId).uniqueResult();
    }
}
