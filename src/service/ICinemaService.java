package service;

import beans.Cinema;

import java.util.List;

public interface ICinemaService {
    public List<Cinema> findAllCinema();
    public String addCinema(Cinema cinema);
    public void updateCinema(Cinema cinema);
}
