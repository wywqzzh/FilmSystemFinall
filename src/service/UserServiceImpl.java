package service;

import beans.User;
import dao.IUserDao;

import javax.transaction.Transactional;

public class UserServiceImpl implements IUserService{
    private IUserDao userDao;


    public IUserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(IUserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    @Transactional
    public String addUser(User user) {
        User user1=userDao.selectUserByName(user);
        if(user1!=null) return "fail";
        else{
            userDao.insertUser(user);
            return "success";
        }
    }

    @Override
    @Transactional
    public String verifyUser(User user) {
        User user1=userDao.selectUserByNamePassword(user);
       if(user==null) return "fail";
       else return "success";
    }
}
