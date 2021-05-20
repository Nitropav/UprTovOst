package diplom.controller;

import diplom.model.Product;
import diplom.model.Production;
import diplom.service.ProductService;
import diplom.service.ProductionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/production")
@PreAuthorize("hasAuthority('USER')")
public class ProductionController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductionService productionService;

    @GetMapping
    public String ProductionList(Map<String, Object> model) {
        Iterable<Product> products = productService.loadAllProducts();
        model.put("products", products);
        Iterable<Production> productions = productionService.loadAllProductions();
        model.put("productions", productions);

        return "production";
    }

    @PostMapping
    public String addProduction(@RequestParam String datetime, @RequestParam("choiceProduct") String choice,
                                @RequestParam int countProduction, Map<String, Object> model) {
        Iterable<Product> products = productService.loadAllProducts();
        Product product = new Product();
        for (Product resultProduct: products) {
            if (resultProduct.getModel().equals(choice)){
                product = resultProduct;
            }
        }
        model.put("products", products);
        Production production = new Production(datetime, choice, countProduction, product.getId());

        productionService.saveProductions(production);

        Iterable<Production> productions = productionService.loadAllProductions();
        model.put("productions", productions);
        Product currProduct = productService.loadModelProduct(choice);
        productionService.addProduct(production, currProduct);

        return "production";
    }

    @PostMapping("/filter")
    public String filterProduction(@RequestParam("filter") String filter, Map<String, Object> model) {
        Iterable<Production> productions;
        if (filter != null && !filter.isEmpty()) {
            productions = productionService.loadProductionByDateTime(filter);
        } else {
            productions = productionService.loadAllProductions();
        }

        model.put("productions", productions);

        return "production";
    }

    @PostMapping("deleteProduction")
    public String deleteEvent(@RequestParam("productionId") Production production, Map<String, Object> model){
        Iterable<Product> products = productService.loadAllProducts();
        model.put("products", products);
        productionService.deleteProductions(production);
        Iterable<Production> productions = productionService.loadAllProductions();
        model.put("productions", productions);

        return "production";
    }

    @GetMapping("/{production}")
    public String editTovarooborot(@PathVariable Production production, Model model) {
        model.addAttribute("production", production);
        return "editProduction";
    }

    @PostMapping("/show")
    public String edit(@RequestParam String datetime, @RequestParam String name, @RequestParam int count,
                       @RequestParam("idproduction") Production production){

        production.setDatetime(datetime);
        production.setName(name);
        production.setCountProduction(count);
        productionService.saveProductions(production);

        return "redirect:/production";
    }
}
