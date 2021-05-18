package service;

import beans.Cinema;
import dao.ICinemaDao;

import javax.transaction.Transactional;
import java.util.List;

public class CinemaServiceImpl implements ICinemaService{
    private ICinemaDao cinemaDao;

    public void setCinemaDao(ICinemaDao cinemaDao) {
        this.cinemaDao = cinemaDao;
    }

    @Override
    @Transactional
    public List<Cinema> findAllCinema() {
        return cinemaDao.selectAllCinema();
    }

    @Override
    @Transactional
    public String addCinema(Cinema cinema) {
            cinemaDao.insertCinema(cinema);
            return "success";
    }

    @Override
    @Transactional
    public void updateCinema(Cinema cinema) {
        cinemaDao.updateCinema(cinema);
    }

    @Override
    @Transactional
    public Cinema findCinemaById(String cinemaId) {
        return cinemaDao.selectCinemaById(cinemaId);
    }
}
