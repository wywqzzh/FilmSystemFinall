package service;

import beans.Filearrangementmessage;
import beans.Hall;
import dao.IFilearrangementmessageDao;
import dao.IHallDao;

import javax.transaction.Transactional;

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
}
