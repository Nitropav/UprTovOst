package diplom.service;

import diplom.model.Client;
import diplom.reposit.ClientReposit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ClientService {
    @Autowired
    private ClientReposit clientReposit;

    @Transactional
    public List<Client> loadClientByPhone(String phone) {
        return clientReposit.findByPhone(phone);
    }

    @Transactional
    public Iterable<Client> loadAllClients() {
        return clientReposit.findAll();
    }

    @Transactional
    public Client saveClients(Client client) {
        return clientReposit.save(client);
    }

    @Transactional
    public void deleteClient(Client client) {
        clientReposit.delete(client);
    }
}
