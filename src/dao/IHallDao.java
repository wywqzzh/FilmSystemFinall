package dao;

import beans.Hall;

import java.util.List;

public interface IHallDao {
    public void insertHall(Hall hall);
    public List<Hall> selectAllHallByCinemaId(String cinemaId);
    public void deleteHallById(String Id);
    public Hall selectHallByCinemaIdAndNum(String cinemaId,int num);
}
