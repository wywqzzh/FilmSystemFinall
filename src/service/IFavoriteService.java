package service;

import beans.Favorite;

public interface IFavoriteService {
    public void addFavorite(Favorite favorite);
    public void removeFavorite(Favorite favorite);
}
