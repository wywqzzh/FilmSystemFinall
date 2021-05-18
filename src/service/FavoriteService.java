package service;

import beans.Favorite;
import dao.IFavoriteDao;

import javax.transaction.Transactional;

public class FavoriteService implements IFavoriteService{
    private IFavoriteDao favoriteDao;

    public void setFavoriteDao(IFavoriteDao favoriteDao) {
        this.favoriteDao = favoriteDao;
    }

    @Override
    @Transactional
    public void addFavorite(Favorite favorite) {
        favoriteDao.insertFavorite(favorite);
    }

    @Override
    @Transactional
    public void removeFavorite(Favorite favorite) {
        favoriteDao.deleteFavorite(favorite);
    }
}
