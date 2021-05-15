package dao;

import beans.Cinema;
import beans.User;

import java.util.List;

public interface ICinemaDao {
    public List<Cinema> selectAllCinema();
    public void insertCinema(Cinema cinema);
    public List<Cinema> selectCinemaByName(String name);
    public void updateCinema(Cinema cinema);
}
