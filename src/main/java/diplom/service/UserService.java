package diplom.service;

import diplom.model.User;
import diplom.reposit.UserReposit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserReposit userReposit;

    @Autowired
    private MailSender mailSender;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userReposit.findByUsername(username);
    }

    @Transactional
    public Iterable<User> loadAllUsers(){
        return userReposit.findAll();
    }

    @Transactional
    public User saveUsers(User user){
        return userReposit.save(user);
    }

    @Transactional
    public void deleteUser(User user){
        userReposit.delete(user);
    }

    @Transactional
    public List<User> loadUserByActive(boolean active){
        return  userReposit.findByActive(active);
    }

    @Transactional
    public User loadUserById(int id){
        return userReposit.findById(id);
    }

    @Transactional
    public void leaveAnswer(User user){
        mailSender.send(user.getEmail(), "Остатки", String.format("Ваш отчет!.", user.getUsername()));
    }
}
