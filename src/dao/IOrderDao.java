package dao;

import beans.Order;
import net.sf.ehcache.search.expression.Or;

import java.util.List;

public interface IOrderDao {
    public int selectOrderJointArrangeByUserNameFilmId(String userName,String filmId);
    public void insertOrder(Order order);
    public void insertOrderBySql(Order order);
    public void deleteOrder(Order order);
    public List<Order> selectAllOrderByUserName(String userName);
    public void updateOrder(Order order);
}
