package dao;

import beans.User;
import org.hibernate.SessionFactory;

import javax.transaction.Transactional;
import java.util.List;

public class UserDaoImpl implements IUserDao{
    private SessionFactory sessionFactory;
    @Override
//    @Transactional
    public void insertUser(User user) {
        sessionFactory.getCurrentSession().save(user);
    }

    @Override
//    @Transactional
    public User selectUserByNamePassword(User user) {
        String hql="from User where userName=:name and userPassword=:password";
        String name=user.getUserName();
        String password=user.getUserPassword();
        return (User) sessionFactory.getCurrentSession().createQuery(hql).
                setParameter("name",name).setParameter("password",password).uniqueResult();
    }

    @Override
//    @Transactional
    public User selectUserByName(User user) {
        String hql="from User where userName=:name";
        String name=user.getUserName();
        String password=user.getUserPassword();
        return (User) sessionFactory.getCurrentSession().createQuery(hql).
                setParameter("name",name).uniqueResult();
    }

    @Override
    public List<User> selectUserByType(int type) {
        String hql="from User where userType<:userType";
        return getSessionFactory().getCurrentSession().createQuery(hql).
        setParameter("userType",type).list();
    }

    @Override
    public void updateUserForState(String name, int state) {
        String hql="update User set userState=:state where userName=:name";
        getSessionFactory().getCurrentSession().createQuery(hql).setParameter("state",state).setParameter("name",name).executeUpdate();
        sessionFactory.getCurrentSession().clear();
    }

    @Override
    public void updateUserForType(String name, int type) {
        String hql="update User set userType=:type where userName=:name";
        getSessionFactory().getCurrentSession().createQuery(hql).setParameter("type",type).setParameter("name",name).executeUpdate();
        sessionFactory.getCurrentSession().clear();
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
