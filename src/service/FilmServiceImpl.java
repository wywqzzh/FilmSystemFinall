package service;

import beans.Filearrangementmessage;
import beans.Film;
import dao.IFilearrangementmessageDao;
import dao.IFilmDao;

import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

//    @Override
//    @Transactional
//    public List<Film> findWillFilm(Timestamp time) {
//        List<Filearrangementmessage> arranges=arrangDao.selectArrangeWill(time);
//        List<String> filmIds=new ArrayList<String>();
//        Map<String, Integer> map=new HashMap<String, Integer>();
//
//        List<Film> films=new ArrayList<Film>();
//        for(Filearrangementmessage arrange:arranges){
//            if(map.get(arrange.getFilmId())==null){
//                map.put(arrange.getFilmId(),1);
//                filmIds.add(arrange.getFilmId());
//            }
//        }
//        for(String filmId:filmIds){
//            films.add(filmDao.selectFilmById(filmId));
//        }
//        return films;
//    }

    @Override
    @Transactional
    public List<Film> findFilmByKeywords(String keywords) {

        return filmDao.selectFilmByNameLike(keywords);
    }

    @Override
    @Transactional
    public Film findFilmById(String filmId) {
        return filmDao.selectFilmById(filmId);
    }

    @Override
    @Transactional
    public List<Film> findHotFilm(Timestamp time) {
        List<Filearrangementmessage> arranges=arrangDao.selectArrangeHot(time);
        List<String> filmIds=new ArrayList<String>();
        Map<String, Integer> map=new HashMap<String, Integer>();

        List<Film> films=new ArrayList<Film>();
        for(Filearrangementmessage arrange:arranges){
            if(map.get(arrange.getFilmId())==null){
                map.put(arrange.getFilmId(),1);
                filmIds.add(arrange.getFilmId());
            }
        }
        for(String filmId:filmIds){
            films.add(filmDao.selectFilmById(filmId));
        }
        return films;
    }
}
