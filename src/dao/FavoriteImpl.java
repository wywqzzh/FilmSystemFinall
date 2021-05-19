package dao;

import beans.Favorite;
import org.hibernate.SessionFactory;

import javax.transaction.Transactional;
import java.util.List;

public class FavoriteImpl implements IFavoriteDao{
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void insertFavorite(Favorite favorite) {
        sessionFactory.getCurrentSession().save(favorite);
    }

    @Override
    public void deleteFavorite(Favorite favorite) {
        sessionFactory.getCurrentSession().delete(favorite);
    }

    @Override
    public Favorite selectFavorite(Favorite favorite) {
        String hql="from Favorite where userName=:name and filmId=:id";
        return (Favorite) sessionFactory.getCurrentSession().createQuery(hql).setParameter("name",favorite.getUserName()).
                setParameter("id",favorite.getFilmId()).uniqueResult();
    }

    @Override
    public List<Favorite> selectFavoriteByUserName(String userName) {
        String hql="from Favorite where userName=:name";
        return sessionFactory.getCurrentSession().createQuery(hql).setParameter("name",userName).list();
    }
}
