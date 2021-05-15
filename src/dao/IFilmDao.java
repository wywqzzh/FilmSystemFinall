package dao;

import beans.Film;

import java.util.List;

public interface IFilmDao {
    public List<Film> selectAllFilm();

    public List<Film> selectFilmByName(String name);

    public List<Film> SselectFilmByName(String name);

    public Film selectFilmById(String Id);
}
