package dao;

import beans.Filearrangementmessage;

import java.sql.Timestamp;
import java.util.List;

public interface IFilearrangementmessageDao {
    public void insertArrange(Filearrangementmessage filearrangementmessage);
    public List<Filearrangementmessage> selectAByTime(java.sql.Timestamp timestamp);
    public List<Filearrangementmessage> selectArrangeHot(Timestamp time);
    public List<Filearrangementmessage> selectArrangeWill(Timestamp time);
    public List<Filearrangementmessage> selectArrangeByTimeFilmId(Timestamp timestamp,String filmId);
    public Filearrangementmessage selectArrangeById(String arrangeId);
}
