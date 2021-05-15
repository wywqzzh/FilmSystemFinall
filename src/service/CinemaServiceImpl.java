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
        Cinema cinema1=cinemaDao.selectCinemaByName(cinema.getCinemaName());
        if(cinema1!=null) return "input";
        else {
            cinemaDao.insertCinema(cinema);
            return "success";
        }
    }

    @Override
    @Transactional
    public void updateCinema(Cinema cinema) {
        cinemaDao.updateCinema(cinema);
    }
}
