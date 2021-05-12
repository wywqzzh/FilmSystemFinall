package dao;

import beans.User;
import org.hibernate.SessionFactory;

import javax.transaction.Transactional;

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

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
