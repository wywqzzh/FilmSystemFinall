package service;

import beans.User;
import dao.IUserDao;

import java.util.List;

public interface IUserService {

    //注册所需功能
    public String addUser(User user);


    public String verifyUser(User user);

    public List<User> findUserByType(int type);

    public List<User> updateUserForState(String name,int state,int type);

    public List<User> updateUserForType(String name,int type,int Type);
    public User findUserByName(String name);


}
