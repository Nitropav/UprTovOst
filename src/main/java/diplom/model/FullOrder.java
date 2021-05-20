package diplom.model;

import javax.persistence.*;

@Entity
@Table(name = "full_order")
public class FullOrder {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idOrder;

    private String address;
    private int countProduct;
    private int cost;
    private String delivery;
    private String fio;
    private String name;
    private int clientId;
    private int productId;
    private String status;

    public FullOrder() {
    }

    public FullOrder(String address, int countProduct, int cost, String delivery, String fio, String name, int clientId, int productId, String status) {
        this.address = address;
        this.countProduct = countProduct;
        this.cost = cost;
        this.delivery = delivery;
        this.fio = fio;
        this.name = name;
        this.clientId = clientId;
        this.productId = productId;
        this.status = status;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getCountProduct() {
        return countProduct;
    }

    public void setCountProduct(int countProduct) {
        this.countProduct = countProduct;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public String getDelivery() {
        return delivery;
    }

    public void setDelivery(String delivery) {
        this.delivery = delivery;
    }

    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getFio() {
        return fio;
    }

    public void setFio(String fio) {
        this.fio = fio;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
