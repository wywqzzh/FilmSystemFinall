package service;

import beans.Review;

import java.util.List;

public interface IReviewService {
    public String addReview(Review review);
    public List<Review> findAllReview();
    public void removeReview(String userName,String filmId);
    public List<Review> findReviewByFilmId(String filmId);
}
