package service;

import beans.Film;
import dao.IFilearrangementmessageDao;
import dao.IFilmDao;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

public class FilmServiceImpl implements IFilmService{
    private IFilmDao filmDao;
    private IFilearrangementmessageDao arrangDao;

    public IFilearrangementmessageDao getArrangDao() {
        return arrangDao;
    }

    public void setArrangDao(IFilearrangementmessageDao arrangDao) {
        this.arrangDao = arrangDao;
    }

    public IFilmDao getFilmDao() {
        return filmDao;
    }

    public void setFilmDao(IFilmDao filmDao) {
        this.filmDao = filmDao;
    }

    @Override
    @Transactional
    public List<Film> findAllFilm() {
        return filmDao.selectAllFilm();
    }

    @Override
    @Transactional
    public List<Film> findFilmByName(String name) {
        return filmDao.selectFilmByName(name);
    }

    @Override
    @Transactional
    public List<Film> findWillFilm(int n) {
        List<String> filmIds=arrangDao.selectWillArrange();
        List<Film> films=new ArrayList<Film>();
        for(int i=0;i<n && i<filmIds.size();i++)
        {
            films.add(filmDao.selectFilmById(filmIds.get(i)));
        }
        return films;
    }
}
