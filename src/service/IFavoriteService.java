package service;

import beans.Favorite;

import java.util.List;

public interface IFavoriteService {
    public void addFavorite(Favorite favorite);
    public void removeFavorite(Favorite favorite);
    public Favorite findFavorite(Favorite favorite);
    public List<Favorite> findFavoriteByUserName(String userName);
}
