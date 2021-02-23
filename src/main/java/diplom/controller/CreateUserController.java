package diplom.controller;

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
    public String addMaster(@RequestParam String fIO, @RequestParam String date_of_birth, @RequestParam int category,
                            @RequestParam int profile, @RequestParam String year_start_working, Map<String, Object> model) {
        Master master = new Master(fIO, date_of_birth, category, profile, year_start_working);

        masterService.saveMasters(master);

        Iterable<Master> masters = masterService.loadAllMasters();
        model.put("masters", masters);

        return "master";
    }
}
