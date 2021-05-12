package service;

import beans.User;
import dao.IUserDao;

public interface IUserService {

    //注册所需功能
    public String addUser(User user);


    public String verifyUser(User user);

}
