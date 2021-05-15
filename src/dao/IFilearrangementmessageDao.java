package dao;

import beans.Filearrangementmessage;

import java.util.List;

public interface IFilearrangementmessageDao {
    public void insertArrange(Filearrangementmessage filearrangementmessage);
    public List<Filearrangementmessage> selectAByTime(java.sql.Timestamp timestamp);
    public List<String> selectWillArrange();
}
