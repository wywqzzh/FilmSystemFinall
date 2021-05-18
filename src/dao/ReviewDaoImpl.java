package dao;

import beans.Review;
import org.hibernate.SessionFactory;

import java.util.List;

public class ReviewDaoImpl implements IReviewDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public Review selectReviewByUserNameFilmId(String userName, String filmId) {
        String hql="from Review where userName=:name and filmId=:id";
        return (Review) sessionFactory.getCurrentSession().createQuery(hql).setParameter("name",userName).setParameter("id",filmId).uniqueResult();
    }

    @Override
    public void addReview(Review review) {
        sessionFactory.getCurrentSession().save(review);
    }

    @Override
    public List<Review> selectAllReview() {
        String hql="from Review";
        return sessionFactory.getCurrentSession().createQuery(hql).list();
    }

    @Override
    public void deleteReviewByUserNameFilmId(String userName, String filmId) {
        String hql="delete from Review where userName=:name and filmId=:id";
        sessionFactory.getCurrentSession().createQuery(hql).setParameter("name",userName).setParameter("id",filmId).executeUpdate();
        sessionFactory.getCurrentSession().clear();
    }
}
