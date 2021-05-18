package service;

import beans.Seat;
import dao.ISeatDao;

import javax.transaction.Transactional;
import java.util.List;

public class SeatServiceImpl implements ISeatService{
    private ISeatDao seatDao;

    public void setSeatDao(ISeatDao seatDao) {
        this.seatDao = seatDao;
    }

    @Override
    @Transactional
    public List<Seat> findByArrangeId(String arrangeId) {
        return seatDao.selectSeatByArrangeId(arrangeId);
    }

    @Override
    @Transactional
    public void addSeat(Seat seat) {
        seatDao.insertSeat(seat);
    }

    @Override
    @Transactional
    public Seat findSeat(Seat seat) {
        return seatDao.selectSeatByAll(seat);
    }

    @Override
    @Transactional
    public void removeSeat(Seat seat) {
        seatDao.deleteSeat(seat);
    }
}
