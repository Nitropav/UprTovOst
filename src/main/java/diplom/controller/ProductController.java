package diplom.controller;

import diplom.model.Product;
import diplom.model.Residual;
import diplom.service.ProductService;
import diplom.service.ResidualService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/product")
@PreAuthorize("hasAuthority('USER')")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ResidualService residualService;

    @GetMapping
    public String ProductList(Map<String, Object> model) {
        Iterable<Product> products = productService.loadAllProducts();
        model.put("products", products);

        return "product";
    }

    @PostMapping
    public String addProduct(@RequestParam String model, @RequestParam int price, @RequestParam String typ,
                             @RequestParam String shell, @RequestParam String kernel, Map<String, Object> modelMap) {
        Product product = new Product(model, price, typ, shell, kernel);

        productService.saveProducts(product);

        Iterable<Product> products = productService.loadAllProducts();
        modelMap.put("products", products);

        return "product";
    }

    @PostMapping("/filter")
    public String filterProduct(@RequestParam("filter") String filter, Map<String, Object> model) {
        Iterable<Product> products;
        if (filter != null && !filter.isEmpty()) {
            products = productService.loadProductByTyp(filter);
        } else {
            products = productService.loadAllProducts();
        }

        model.put("products", products);

        return "product";
    }

    @PostMapping("deleteProduct")
    public String deleteEvent(@RequestParam("productId") Product product, Map<String, Object> model) {
        productService.deleteProduct(product);

        Iterable<Residual> residuals = residualService.loadAllResiduals();
        Residual residual = new Residual();
        for (Residual resultResidual : residuals) {
            if (resultResidual.getName().equals(product.getModel())){
                residual = resultResidual;
            }
        }
        residualService.deleteResidual(residual);

        Iterable<Product> products = productService.loadAllProducts();
        model.put("products", products);

        return "product";
    }

    @GetMapping("/{product}")
    public String editProduct(@PathVariable Product product, Model model) {
        model.addAttribute("product", product);
        return "editProduct";
    }

    @PostMapping("/show")
    public String edit(@RequestParam String model, @RequestParam int price, @RequestParam String typ,
                       @RequestParam String shell, @RequestParam String kernel, @RequestParam("id") Product product) {

        product.setModel(model);
        product.setPrice(price);
        product.setTyp(typ);
        product.setShell(shell);
        product.setKernel(kernel);
        productService.saveProducts(product);

        return "redirect:/product";
    }
}
