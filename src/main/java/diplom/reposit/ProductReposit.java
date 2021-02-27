package diplom.reposit;

import diplom.model.Product;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductReposit extends CrudRepository<Product, Integer> {
    Product findByModel(String model);
    List<Product> findByTyp(String typ);
}
