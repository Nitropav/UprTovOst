package diplom.controller;

import diplom.model.Role;
import diplom.model.User;
import diplom.reposit.UserReposit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegisterController {
    @Autowired
    private UserReposit userReposit;

    @GetMapping("/registrationUserInfo")
    public String registrationUserInfo() {
        return "registrationUserInfo";
    }

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addInfoAboutUser(User User, Map<String, Object> model) {

        User UserFromDB = userReposit.findByUsername(User.getUsername());

        if (UserFromDB != null) {
            model.put("message", "User with number or email already exist!" + User.getFNAME());
            return "registrationUserInfo";
        }
        User.setActive(true);
        User.setRoles(Collections.singleton(Role.USER));
        userReposit.save(User);
        return "redirect:/login";
    }
}
