package diplom.controller;

import diplom.model.Role;
import diplom.model.User;
import diplom.service.CreateUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/createuser")
@PreAuthorize("hasAuthority('ADMIN')")
public class CreateUserController {

    @Autowired
    private CreateUserService createUserService;

    @GetMapping
    public String userList(Map<String, Object> model) {
        Iterable<User> users = createUserService.loadAllUsers();
        model.put("users", users);

        return "createuser";
    }

    @PostMapping
    public String addUser(@RequestParam String username, @RequestParam String LNAME, @RequestParam String FNAME,
                          @RequestParam String password, @RequestParam String email, @RequestParam boolean active,
                          @RequestParam Set<Role> roles, Map<String, Object> model) {
        User user = new User(username, LNAME, FNAME, password, email, active, roles);

        createUserService.saveUsers(user);

        Iterable<User> users = createUserService.loadAllUsers();
        model.put("users", users);

        return "createuser";
    }
}
