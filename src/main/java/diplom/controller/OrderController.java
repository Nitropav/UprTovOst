package diplom.controller;

import diplom.model.Client;
import diplom.model.FullOrder;
import diplom.model.Product;
import diplom.service.ClientService;
import diplom.service.OrderService;
import diplom.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/order")
@PreAuthorize("hasAuthority('USER')")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private ClientService clientService;

    @Autowired
    private ProductService productService;

    @GetMapping
    public String OrderList(Map<String, Object> model) {
        Iterable<Client> clients = clientService.loadAllClients();
        model.put("clients", clients);

        Iterable<Product> products = productService.loadAllProducts();
        model.put("products", products);

        Iterable<FullOrder> orders = orderService.loadAllOrders();
        model.put("orders", orders);

        return "order";
    }

    @PostMapping
    public String addOrder(@RequestParam String address, @RequestParam int countProduct,
                           @RequestParam String delivery, @RequestParam("choiceClient") String choiceClient,
                           @RequestParam("choiceProduct") String choiceProduct,
                           Map<String, Object> model) {
        int cost = 0;
        Iterable<Client> clients = clientService.loadAllClients();
        Client client = new Client();
        for (Client resultClient : clients) {
            if (resultClient.getFio().equals(choiceClient)) {
                client = resultClient;
            }
        }
        model.put("clients", clients);

        Iterable<Product> products = productService.loadAllProducts();
        Product product = new Product();
        for (Product resultProduct : products) {
            if (resultProduct.getModel().equals(choiceProduct)) {
                product = resultProduct;
            }
        }
        model.put("products", products);
        cost = product.getPrice() * countProduct;

        FullOrder fullOrder = new FullOrder(address, countProduct, cost, delivery,
                choiceClient, choiceProduct, client.getId(), product.getId(), "Выполняется");

        orderService.saveOrders(fullOrder);

        Iterable<FullOrder> orders = orderService.loadAllOrders();
        model.put("orders", orders);

        return "order";
    }

    @PostMapping("/filter")
    public String filterOrder(@RequestParam("filter") String filter, Map<String, Object> model) {
        Iterable<FullOrder> orders;
        if (filter != null && !filter.isEmpty()) {
            orders = orderService.loadOrderByAddress(filter);
        } else {
            orders = orderService.loadAllOrders();
        }

        model.put("orders", orders);

        return "order";
    }
}
