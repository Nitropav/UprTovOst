package diplom.controller;

import diplom.model.Client;
import diplom.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/client")
@PreAuthorize("hasAuthority('USER')")
public class ClientController {
    @Autowired
    private ClientService clientService;

    @GetMapping
    public String ClientList(Map<String, Object> model) {
        Iterable<Client> clients = clientService.loadAllClients();
        model.put("clients", clients);

        return "client";
    }

    @PostMapping
    public String addClient(@RequestParam String fio, @RequestParam String phone,
                            @RequestParam String email, Map<String, Object> model) {
        Client client = new Client(fio, phone, email);

        clientService.saveClients(client);

        Iterable<Client> clients = clientService.loadAllClients();
        model.put("clients", clients);

        return "client";
    }

    @PostMapping("/filter")
    public String filterClient(@RequestParam("filter") String filter, Map<String, Object> model) {
        Iterable<Client> clients;
        if (filter != null && !filter.isEmpty()) {
            clients = clientService.loadClientByPhone(filter);
        } else {
            clients = clientService.loadAllClients();
        }

        model.put("clients", clients);

        return "client";
    }

    @PostMapping("deleteClient")
    public String deleteEvent(@RequestParam("clientId") Client client, Map<String, Object> model) {
        clientService.deleteClient(client);

        Iterable<Client> clients = clientService.loadAllClients();
        model.put("clients", clients);

        return "client";
    }

    @GetMapping("/{client}")
    public String editClient(@PathVariable Client client, Model model) {
        model.addAttribute("client", client);
        return "editClient";
    }

    @PostMapping("/show")
    public String edit(@RequestParam String fio, @RequestParam String phone,
                       @RequestParam String email, @RequestParam("id") Client client) {

        client.setFio(fio);
        client.setPhone(phone);
        client.setEmail(email);
        clientService.saveClients(client);

        return "redirect:/client";
    }
}
