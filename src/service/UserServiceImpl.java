package service;

import beans.User;
import dao.IUserDao;

import javax.transaction.Transactional;
import java.util.List;

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
        if(user1==null) return "fail";
        else if(user1.getUserType()==1) return "manager";
        else if(user1.getUserType()==2) return "root";
        else if(user1.getUserType()==0) return "success";
        else return "input";
    }

    @Override
    @Transactional
    public List<User> findUserByType(int type) {

        return userDao.selectUserByType(type);
    }

    @Override
    @Transactional
    public List<User> updateUserForState(String name, int state,int type) {
        userDao.updateUserForState(name,state);
        return userDao.selectUserByType(type);
    }

    @Override
    @Transactional
    public List<User> updateUserForType(String name, int type,int Type) {
        userDao.updateUserForType(name,type);
        return userDao.selectUserByType(Type);
    }
}
