package dao;

import beans.Order;
import org.hibernate.SessionFactory;

import java.util.List;

public class OrderDaoImpl implements IOrderDao{
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public int selectOrderJointArrangeByUserNameFilmId(String userName, String filmId) {
        String hql="select count(*) from Filearrangementmessage as f,order as o where f.arrangeId=o.arrangeId and o.userName=:name and f.filmId=:id";
        return (int) sessionFactory.getCurrentSession().createQuery(hql).setParameter("name",userName).setParameter("id",filmId).uniqueResult();
    }

    @Override
    public void insertOrder(Order order) {
        sessionFactory.getCurrentSession().save(order);
    }

    @Override
    public void insertOrderBySql(Order order) {
        String sql="insert into order(orderId,userName,arrangeId,orderDate,orderState,cost) VALUES(:orderId, :userName, :arrangeId, :orderDate, :orderState, :cost)";
        sessionFactory.getCurrentSession().createSQLQuery(sql).setParameter("orderId",order.getOrderId()).
                setParameter("userName",order.getUserName()).setParameter("arrangeId",order.getArrangeId()).
                setParameter("orderDate",order.getOrderDate()).setParameter("orderState",order.getOrderState()).
                setParameter("cost",order.getCost()).executeUpdate();
    }

    @Override
    public void deleteOrder(Order order) {
        sessionFactory.getCurrentSession().delete(order);
    }

    @Override
    public List<Order> selectAllOrderByUserName(String userName) {
        String hql="from Order where userName=:name";
        return sessionFactory.getCurrentSession().createQuery(hql).setParameter("name",userName).list();
    }
}
