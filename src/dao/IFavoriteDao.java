package dao;

import beans.Favorite;

public interface IFavoriteDao {
    public void insertFavorite(Favorite favorite);
    public void deleteFavorite(Favorite favorite);
}
