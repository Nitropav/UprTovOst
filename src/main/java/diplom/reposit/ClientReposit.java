package diplom.reposit;

import diplom.model.Client;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClientReposit extends CrudRepository<Client, Integer> {
    List<Client> findByPhone(String phone);
}
