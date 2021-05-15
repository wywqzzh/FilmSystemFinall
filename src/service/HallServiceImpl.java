package service;

import beans.Hall;
import dao.IHallDao;

public class HallServiceImpl implements IHallService{
    private IHallDao hallDao;

    public IHallDao getHallDao() {
        return hallDao;
    }

    public void setHallDao(IHallDao hallDao) {
        this.hallDao = hallDao;
    }

    @Override
    public String addHall(Hall hall) {
        hallDao.insertHall(hall);
        return "success";
    }
}
