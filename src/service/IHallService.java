package service;

import beans.Hall;

import java.util.List;

public interface IHallService {
    public String addHall(Hall hall);
    public List<Hall> findAllHallByCinemaId(String cinemaId);
    public void removeHallById(String Id);
    public Hall findHallByCinemaIdAndNum(String cinemaId,int num);
}
