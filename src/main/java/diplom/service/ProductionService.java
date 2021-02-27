package diplom.service;

import diplom.model.Product;
import diplom.model.Production;
import diplom.reposit.ProductionReposit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProductionService {
    @Autowired
    private ProductionReposit productionReposit;

    @Transactional
    public List<Production> loadProductionByDateTime(String datetime){
        return productionReposit.findByDatetime(datetime);
    }

    @Transactional
    public Iterable<Production> loadAllProductions(){
        return productionReposit.findAll();
    }

    @Transactional
    public Iterable<Production> loadAllProductionProduct(int product){
        return productionReposit.findById(product);
    }

    @Transactional
    public Production saveProductions(Production production){
        return productionReposit.save(production);
    }

    public void addProduct(Production production, Product product) {
        production.getProducts().add(product);

        productionReposit.save(production);
    }

    @Transactional
    public void deleteProductions(Production production){
        productionReposit.delete(production);
    }
}
