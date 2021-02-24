package diplom.service;

import diplom.model.User;
import diplom.reposit.CreateUserReposit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CreateUserService {
    @Autowired
    private CreateUserReposit createUserReposit;
    @Transactional
    public Iterable<User> loadAllUsers(){
        return createUserReposit.findAll();
    }

    @Transactional
    public List<User>loadUserByLogin(String login){
        return createUserReposit.findByUsername(login);
    }

    @Transactional
    public User saveUsers(User users){
        return createUserReposit.save(users);
    }

    @Transactional
    public void deleteUser(User user){
        createUserReposit.delete(user);
    }

    @Transactional
    public User loadUser(int id){
        return createUserReposit.findById(id);
    }
}
