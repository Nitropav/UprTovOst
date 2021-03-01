package diplom.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "production")
public class Production {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private String datetime;
    private String name;
    private int count;

    @ManyToMany
    @JoinTable(
            name = "nameproduct_production",
            joinColumns = { @JoinColumn(name = "idproduct")},
            inverseJoinColumns = { @JoinColumn(name = "idproduction") }
    )
    private Set<Product> products = new HashSet<>();

    public Production() {
    }

    public Production(String datetime, String name, int count) {
        this.datetime = datetime;
        this.name = name;
        this.count = count;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Set<Product> getProducts() {
        return products;
    }

    public void setProducts(Set<Product> products) {
        this.products = products;
    }
}
