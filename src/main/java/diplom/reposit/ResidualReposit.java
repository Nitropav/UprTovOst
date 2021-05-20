package diplom.reposit;

import diplom.model.Residual;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ResidualReposit extends CrudRepository<Residual, Integer> {

    List<Residual> findByName(String name);
}
