package diplom.reposit;

import diplom.model.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserReposit extends CrudRepository<User, Long> {
    User findByUsername(String username);

    List<User> findByActive(boolean active);

    User findById(int id);
}
