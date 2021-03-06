package diplom.controller;

import diplom.model.User;
import diplom.service.CreateUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/blockuser")
@PreAuthorize("hasAuthority('ADMIN')")
public class BlockUserController {
    @Autowired
    private CreateUserService createUserService;

    @GetMapping
    public String userList(Map<String, Object> model) {
        Iterable<User> users = createUserService.loadAllUsers();
        model.put("users", users);

        return "userInfForBlock";
    }

    @PostMapping("/filter")
    public String filterUser(@RequestParam("filter") String filter, Map<String, Object> model) {
        Iterable<User> users;
        if (filter != null && !filter.isEmpty()) {
            users = createUserService.loadUserByLogin(filter);
        } else {
            users = createUserService.loadAllUsers();
        }

        model.put("users", users);

        return "userInfForBlock";
    }

    @PostMapping("/bl")
    public String blockUser(@RequestParam("userId") User user, Map<String, Object> model) {
        if (user.isActive()) {
            user.setActive(false);
        } else {
            user.setActive(true);
        }
        createUserService.saveUsers(user);

        Iterable<User> users = createUserService.loadAllUsers();
        model.put("users", users);
        return "userInfForBlock";
    }
}
