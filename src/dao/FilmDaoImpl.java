package dao;

import beans.Film;
import org.hibernate.SessionFactory;

import javax.transaction.Transactional;
import java.util.List;

public class FilmDaoImpl implements IFilmDao{
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    @Override
    public List<Film> selectAllFilm() {
        String hql="from Film";
        return sessionFactory.getCurrentSession().createQuery(hql).list();
    }

    @Override
    public List<Film> selectFilmByName(String name) {

        String hql="from Film where filmName=:name";
        return sessionFactory.getCurrentSession().createQuery(hql).setParameter("name",name).list();
    }

    @Override
    public List<Film> selectFilmByNameLike(String name) {
        String sql="from Film where filmName like :name";

        return sessionFactory.getCurrentSession().createQuery(sql).setParameter("name","%"+name+"%").list();
    }

    @Override
    public List<Film> selectFilmByDirectorLike(String name) {
        String sql="from Film where filmDirector like :name";

        return sessionFactory.getCurrentSession().createSQLQuery(sql).setParameter("name","%"+name+"%").addEntity(Film.class).list();
    }

    @Override
    public List<Film> selectFilmByActorLike(String name) {
        String sql="from Film where filmActors like :name";

        return sessionFactory.getCurrentSession().createSQLQuery(sql).setParameter("name","%"+name+"%").addEntity(Film.class).list();
    }

    @Override
    public List<Film> selectFilmByCountryLike(String name) {
        String sql="from Film where filmCountry like :name";

        return sessionFactory.getCurrentSession().createSQLQuery(sql).setParameter("name","%"+name+"%").addEntity(Film.class).list();
    }

    @Override
    @Transactional
    public Film selectFilmById(String Id) {
        String hql="from Film where filmId=:id";

        return (Film) sessionFactory.getCurrentSession().createQuery(hql).setParameter("id",Id).uniqueResult();
    }
}
