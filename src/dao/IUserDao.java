package dao;

import beans.User;

public interface IUserDao {

    public void insertUser(User user);
    public User selectUserByNamePassword(User user);
    public User selectUserByName(User user);
}
