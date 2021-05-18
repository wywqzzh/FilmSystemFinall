package service;

import beans.Seat;

import java.util.List;

public interface ISeatService {
    public List<Seat> findByArrangeId(String arrangeId) ;
    public void addSeat(Seat seat);
    public Seat findSeat(Seat seat);
    public void removeSeat(Seat seat);
}
