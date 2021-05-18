package service;

import beans.Filearrangementmessage;

import java.sql.Timestamp;
import java.util.List;

public interface IArrangeService {
    public void addArrange(Filearrangementmessage arrange);
    public List<Filearrangementmessage> findArrangeWill(Timestamp time);
    public List<Filearrangementmessage> findArrangeByTimeFilmId(Timestamp timestamp,String filmId);
    public Filearrangementmessage findArrangeById(String arrangeId);
}
