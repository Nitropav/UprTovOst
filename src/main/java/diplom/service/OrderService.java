package diplom.service;

import diplom.model.FullOrder;
import diplom.reposit.OrderReposit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderService {

    @Autowired
    private OrderReposit orderReposit;

    @Transactional
    public List<FullOrder> loadOrderByAddress(String address) {
        return orderReposit.findByAddress(address);
    }

    @Transactional
    public Iterable<FullOrder> loadAllOrders() {
        return orderReposit.findAll();
    }

    @Transactional
    public FullOrder saveOrders(FullOrder order) {
        return orderReposit.save(order);
    }

    @Transactional
    public void deleteOrders(FullOrder order) {
        orderReposit.delete(order);
    }
}
