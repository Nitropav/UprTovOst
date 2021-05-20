package diplom.reposit;

import diplom.model.FullOrder;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface OrderReposit extends CrudRepository<FullOrder, Integer> {
    List<FullOrder> findByAddress(String address);
}
