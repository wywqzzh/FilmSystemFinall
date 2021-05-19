package dao;

import beans.Review;

import java.util.List;

public interface IReviewDao {
    public Review selectReviewByUserNameFilmId(String userName,String filmId);
    public void addReview(Review review);
    public List<Review> selectAllReview();
    public void deleteReviewByUserNameFilmId(String userName,String filmId);
    public List<Review> selectReviewByFilmId(String filmId);
    public List<Review> selectReviewByUserName(String userName);

}
