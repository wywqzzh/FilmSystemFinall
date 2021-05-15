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
    @Transactional
    public List<Film> SselectFilmByName(String name) {
        String sql="select a.* from table film Inner join fn_SplitStringToRows(:name)b on CHARINDEX(b.v,a.filmName)>0";

        return sessionFactory.getCurrentSession().createSQLQuery(sql).setParameter("name",name).addEntity(Film.class).list();
    }

    @Override
    @Transactional
    public Film selectFilmById(String Id) {
        String hql="from Film where filmId=:id";

        return (Film) sessionFactory.getCurrentSession().createQuery(hql).setParameter("id",Id).uniqueResult();
    }
}
