package service;

import beans.Hall;
import dao.IHallDao;

import javax.transaction.Transactional;
import java.util.List;

public class HallServiceImpl implements IHallService{
    private IHallDao hallDao;

    public IHallDao getHallDao() {
        return hallDao;
    }

    public void setHallDao(IHallDao hallDao) {
        this.hallDao = hallDao;
    }

    @Override
    @Transactional
    public String addHall(Hall hall) {
        Hall hall1=hallDao.selectHallByCinemaIdAndNum(hall.getCinemaId(),hall.getHallNum());
        if(hall1!=null) return "exist";
        hallDao.insertHall(hall);
        return "success";
    }

    @Override
    @Transactional
    public List<Hall> findAllHallByCinemaId(String cinemaId) {
        return hallDao.selectAllHallByCinemaId(cinemaId);
    }

    @Override
    @Transactional
    public void removeHallById(String Id) {
        hallDao.deleteHallById(Id);
    }
}
