package service;

import beans.Film;

import java.sql.Timestamp;
import java.util.List;

public interface IFilmService {
    public List<Film> findAllFilm();
    public List<Film> findFilmByName(String name);
//    public List<Film> findWillFilm(Timestamp time);
    public List<Film> findFilmByKeywords(String keywords);
    public Film findFilmById(String filmId);
    public List<Film> findHotFilm(Timestamp time);
}
