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
    @Transactional
    public void insertA(Filearrangementmessage filearrangementmessage) {
        sessionFactory.getCurrentSession().save(filearrangementmessage);
    }

    @Override
    @Transactional
    public List<Filearrangementmessage> selectAByTime(Timestamp timestamp) {
        String hql="from Filearrangementmessage where arrangeStartDatetime<:time";
        return sessionFactory.getCurrentSession().createQuery(hql).setParameter("time",timestamp).list();
    }
}
