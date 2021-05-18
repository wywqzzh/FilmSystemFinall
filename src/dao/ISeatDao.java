package dao;

import beans.Seat;

import java.util.List;

public interface ISeatDao {
    public List<Seat> selectSeatByArrangeId(String arrangeId);
    public void insertSeat(Seat seat);
    public Seat selectSeatByAll(Seat seat);
    public void deleteSeat(Seat seat);
}
