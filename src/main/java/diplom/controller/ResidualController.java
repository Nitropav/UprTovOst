package diplom.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/residual")
@PreAuthorize("hasAuthority('USER')")
public class ResidualController {


}
