package diplom.controller;

import diplom.model.Client;
import diplom.model.FullOrder;
import diplom.model.Product;
import diplom.model.Residual;
import diplom.service.ClientService;
import diplom.service.OrderService;
import diplom.service.ProductService;
import diplom.service.ResidualService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

@Controller
@RequestMapping("/order")
@PreAuthorize("hasAuthority('USER')")
public class OrderController {

    private int flag = 2;

    @Autowired
    private OrderService orderService;

    @Autowired
    private ClientService clientService;

    @Autowired
    private ProductService productService;

    @Autowired
    private ResidualService residualService;

    @GetMapping
    public String OrderList(Map<String, Object> model, Model modelUI) {
        Iterable<Residual> residuals = residualService.loadAllResiduals();
        model.put("residuals", residuals);

        Iterable<Client> clients = clientService.loadAllClients();
        model.put("clients", clients);

        Iterable<Product> products = productService.loadAllProducts();
        model.put("products", products);

        Iterable<FullOrder> orders = orderService.loadAllOrders();
        model.put("orders", orders);

        return "order";
    }

    @PostMapping("/create")
    public String addOrder(@RequestParam String address, @RequestParam int countProduct,
                           @RequestParam String delivery, @RequestParam("choiceClient") String choiceClient,
                           @RequestParam("choiceProduct") String choiceProduct,
                           Map<String, Object> model, Model modelUI) {
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

        Iterable<Residual> residuals = residualService.loadAllResiduals();
        Residual residual = new Residual();
        for (Residual resultResidual : residuals) {
            if (product.getModel().equals(resultResidual.getName())) {
                residual = resultResidual;
            }
        }

        cost = product.getPrice() * countProduct;

        FullOrder fullOrder = new FullOrder(address, countProduct, cost, delivery,
                choiceClient, choiceProduct, client.getId(), product.getId(), "Выполняется");

        if (residual.getCount() < countProduct) {
            flag = 1;
        } else if (residual.getCount() >= countProduct) {
            flag = 2;
        }

        if (flag == 2) {
            orderService.saveOrders(fullOrder);
        } else {
            System.out.println("Больше, чем есть");
        }

        modelUI.addAttribute("flagResult", String.valueOf(flag));

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

    @PostMapping("deleteOrder")
    public String deleteEvent(@RequestParam("orderId") FullOrder fullOrder, Map<String, Object> model) {
        int resultCount;
        Iterable<Product> products = productService.loadAllProducts();
        model.put("products", products);
        Iterable<Client> clients = clientService.loadAllClients();
        model.put("clients", clients);
        Iterable<Residual> residuals = residualService.loadAllResiduals();

        if (fullOrder.getStatus().equals("Выполнено")) {
            orderService.deleteOrders(fullOrder);
        } else if (fullOrder.getStatus().equals("Выполняется")) {
            for (Residual residual : residuals) {
                if (fullOrder.getName().equals(residual.getName())) {
                    resultCount = residual.getCount() + fullOrder.getCountProduct();
                    residual.setCount(resultCount);
                    residualService.saveResiduals(residual);
                    orderService.deleteOrders(fullOrder);
                }
            }
        }

        Iterable<FullOrder> orders = orderService.loadAllOrders();
        model.put("orders", orders);

        return "order";
    }

    @PostMapping("/done")
    public String orderDone(@RequestParam("ordersId") FullOrder order, Map<String, Object> model) {
        Iterable<Product> products = productService.loadAllProducts();
        model.put("products", products);
        Iterable<Client> clients = clientService.loadAllClients();
        model.put("clients", clients);

        if (order.getStatus().equals("Выполняется")) {
            order.setStatus("Выполнено");
        } else {
            order.setStatus("Выполняется");
        }
        orderService.saveOrders(order);

        Iterable<FullOrder> orders = orderService.loadAllOrders();
        model.put("orders", orders);
        return "order";
    }
}
