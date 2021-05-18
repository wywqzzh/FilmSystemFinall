package dao;

import beans.Favorite;
import org.hibernate.SessionFactory;

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
}
