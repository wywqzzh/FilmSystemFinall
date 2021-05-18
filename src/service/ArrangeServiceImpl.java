package service;

import beans.Filearrangementmessage;
import beans.Hall;
import dao.IFilearrangementmessageDao;
import dao.IHallDao;

import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.util.List;

public class ArrangeServiceImpl implements IArrangeService {
    private IFilearrangementmessageDao arrangeDao;
    private IHallDao hallDao;

    public IHallDao getHallDao() {
        return hallDao;
    }

    public void setHallDao(IHallDao hallDao) {
        this.hallDao = hallDao;
    }

    public IFilearrangementmessageDao getArrangeDao() {
        return arrangeDao;
    }

    public void setArrangeDao(IFilearrangementmessageDao arrangeDao) {
        this.arrangeDao = arrangeDao;
    }

    @Override
    @Transactional
    public void addArrange(Filearrangementmessage arrange) {
        Hall hall=hallDao.selectHallByCinemaIdAndNum(arrange.getCinemaId(),arrange.getHallNum());
        arrange.setArrangeOnSale(hall.getHallCol()*hall.getHallRow());
        arrange.setArrangeSold(0);
        arrangeDao.insertArrange(arrange);
    }

    @Override
    @Transactional
    public List<Filearrangementmessage> findArrangeWill(Timestamp time) {
        return arrangeDao.selectArrangeWill(time);
    }

    @Override
    @Transactional
    public List<Filearrangementmessage> findArrangeByTimeFilmId(Timestamp timestamp, String filmId) {
        return arrangeDao.selectArrangeByTimeFilmId(timestamp,filmId);
    }

    @Override
    @Transactional
    public Filearrangementmessage findArrangeById(String arrangeId) {

        return arrangeDao.selectArrangeById(arrangeId);
    }
}
