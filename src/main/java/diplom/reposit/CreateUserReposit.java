package diplom.reposit;

import diplom.model.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CreateUserReposit extends CrudRepository<User, Integer> {
    User findById(int id);
}