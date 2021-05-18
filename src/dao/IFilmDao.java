package dao;

import beans.Film;

import java.util.List;

public interface IFilmDao {
    public List<Film> selectAllFilm();

    public List<Film> selectFilmByName(String name);

    public List<Film> selectFilmByNameLike(String name);
    public List<Film> selectFilmByDirectorLike(String name);
    public List<Film> selectFilmByActorLike(String name);
    public List<Film> selectFilmByCountryLike(String name);
    public Film selectFilmById(String Id);
}
