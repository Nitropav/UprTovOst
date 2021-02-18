package diplom.reposit;


import diplom.model.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface UserReposit extends CrudRepository<User, Long> {
    User findByUsername(String username);
    List<User> findByActive(boolean active);
    User findById(int id);
}
