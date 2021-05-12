package dao;

import beans.Cinema;

import java.util.List;

public interface ICinemaDao {
    public List<Cinema> selectAllCinema();
}
