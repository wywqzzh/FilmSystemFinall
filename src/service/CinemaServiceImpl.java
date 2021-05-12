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
}
