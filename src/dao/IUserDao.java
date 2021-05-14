package dao;

import beans.User;

import java.util.List;

public interface IUserDao {

    public void insertUser(User user);
    public User selectUserByNamePassword(User user);
    public User selectUserByName(User user);
    public List<User> selectUserByType(int type);
    public void updateUserForState(String name,int state);
    public void updateUserForType(String name,int type);
}
