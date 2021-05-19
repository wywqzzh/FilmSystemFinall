package service;

import beans.Review;
import dao.IOrderDao;
import dao.IReviewDao;

import javax.transaction.Transactional;
import java.util.List;

public class ReviewServiceImpl implements IReviewService {
    private IReviewDao reviewDao;
    private IOrderDao orderDao;

    public void setOrderDao(IOrderDao orderDao) {
        this.orderDao = orderDao;
    }

    public void setReviewDao(IReviewDao reviewDao) {
        this.reviewDao = reviewDao;
    }

    @Override
    @Transactional
    public String addReview(Review review) {
        Review review1=reviewDao.selectReviewByUserNameFilmId(review.getUserName(),review.getFilmId());
        if(review1!=null) return "exist";
        reviewDao.addReview(review);
        return "success";
    }

    @Override
    @Transactional
    public List<Review> findAllReview() {

        return reviewDao.selectAllReview();
    }

    @Override
    @Transactional
    public void removeReview(String userName, String filmId) {
        reviewDao.deleteReviewByUserNameFilmId(userName,filmId);
    }

    @Override
    @Transactional
    public List<Review> findReviewByFilmId(String filmId) {
        return reviewDao.selectReviewByFilmId(filmId);
    }
}
