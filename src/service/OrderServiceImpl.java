package service;

import beans.Order;
import beans.Seat;
import dao.IOrderDao;
import net.sf.ehcache.search.expression.Or;

import javax.transaction.Transactional;
import java.util.List;

public class OrderServiceImpl implements IOrderService{
    private IOrderDao orderDao;

    public void setOrderDao(IOrderDao orderDao) {
        this.orderDao = orderDao;
    }


    @Override
    @Transactional
    public void addOrder(Order order) {

        orderDao.insertOrder(order);
    }

    @Override
    @Transactional
    public void removeOrder(Order order) {
        orderDao.deleteOrder(order);
    }

    @Override
    @Transactional
    public List<Order> findAllOrderByUserName(String userName) {
        return orderDao.selectAllOrderByUserName(userName);
    }
}
