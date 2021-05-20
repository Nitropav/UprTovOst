package diplom.controller;

import diplom.model.Residual;
import diplom.service.ResidualService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/residual")
@PreAuthorize("hasAuthority('USER')")
public class ResidualController {

    @Autowired
    private ResidualService residualService;

    @GetMapping
    public String residualList(Map<String, Object> model) {
        Iterable<Residual> residuals = residualService.loadAllResiduals();
        model.put("residuals", residuals);

        return "residual";
    }

    @PostMapping("/filter")
    public String filterProduct(@RequestParam("filter") String filter, Map<String, Object> model) {
        Iterable<Residual> residuals;
        if (filter != null && !filter.isEmpty()) {
            residuals = residualService.loadResidualByName(filter);
        } else {
            residuals = residualService.loadAllResiduals();
        }

        model.put("residuals", residuals);

        return "residual";
    }
}
