package diplom.service;

import diplom.model.Product;
import diplom.reposit.ProductReposit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductReposit productReposit;

    @Transactional
    public List<Product> loadProductByTyp(String typ) {
        return productReposit.findByTyp(typ);
    }

    @Transactional
    public Iterable<Product> loadAllProducts() {
        return productReposit.findAll();
    }

    @Transactional
    public Product loadModelProduct(String model) {
        return productReposit.findByModel(model);
    }

    @Transactional
    public Product saveProducts(Product product) {
        return productReposit.save(product);
    }

    @Transactional
    public void deleteProduct(Product product) {
        productReposit.delete(product);
    }
}
