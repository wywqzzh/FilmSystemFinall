package service;

import beans.Film;

import java.util.List;

public interface IFilmService {
    public List<Film> findAllFilm();
    public List<Film> findFilmByName(String name);
    public List<Film> findWillFilm(int n);
}
