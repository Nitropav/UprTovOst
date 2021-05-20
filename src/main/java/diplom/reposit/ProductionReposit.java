package diplom.reposit;

import diplom.model.Production;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductionReposit extends CrudRepository<Production, Integer> {
    List<Production> findByDatetime(String datetime);

    List<Production> findById(int product);
}
