package dao;

import beans.Favorite;

import java.util.List;

public interface IFavoriteDao {
    public void insertFavorite(Favorite favorite);
    public void deleteFavorite(Favorite favorite);
    public Favorite selectFavorite(Favorite favorite);
    public List<Favorite> selectFavoriteByUserName(String userName);
}
