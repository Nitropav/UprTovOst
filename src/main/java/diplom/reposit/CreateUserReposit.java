package diplom.reposit;

import diplom.model.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CreateUserReposit extends CrudRepository<User, Long> {
    User findById(int id);

    List<User> findByUsername(String username);
}
