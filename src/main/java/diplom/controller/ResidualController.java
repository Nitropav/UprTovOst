package diplom.controller;

import diplom.configuration.ExcelExporter;
import diplom.model.Product;
import diplom.model.Residual;
import diplom.service.ProductService;
import diplom.service.ResidualService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/residual")
@PreAuthorize("hasAuthority('USER')")
public class ResidualController {

    @Autowired
    private ResidualService residualService;

    @Autowired
    private ProductService productService;

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

    @GetMapping("/r/export")
    public void exportToExcel(HttpServletResponse response) throws IOException {
        response.setContentType("application/octet-stream");

        String headerkey = "Content-Disposition";
        String headerValue = "attachement; filename=residual.xlsx";

        response.setHeader(headerkey, headerValue);

        List<Residual> residuals = (List<Residual>) residualService.loadAllResiduals();
        List<Product> products = (List<Product>) productService.loadAllProducts();

        ExcelExporter excelExporter = new ExcelExporter(residuals, products);
        excelExporter.export(response);
    }
}
