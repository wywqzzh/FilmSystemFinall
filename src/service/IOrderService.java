package service;

import beans.Order;
import beans.Seat;
import net.sf.ehcache.search.expression.Or;

import java.util.List;

public interface IOrderService {
    public void addOrder(Order order);
    public void removeOrder(Order order);
    public List<Order> findAllOrderByUserName(String userName);
}
