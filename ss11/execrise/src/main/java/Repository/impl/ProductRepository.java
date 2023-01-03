package Repository.impl;

import Model.Product;
import Repository.IProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    private static Map<Integer, Product> productMap = new HashMap<>();

    static {
        productMap.put(1, new Product(1,"iphone 4", 5.5,"Đời nhà Minh","Apple"));
        productMap.put(2, new Product(2,"iphone 5", 5.5,"Đời nhà Minh","Apple"));
        productMap.put(3, new Product(3,"iphone 6", 5.5,"Đời nhà Minh","Apple"));
        productMap.put(4, new Product(4,"iphone 7", 5.5,"Đời nhà Minh","Apple"));
        productMap.put(5, new Product(5,"iphone 8", 5.5,"Đời nhà Minh","Apple"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void save(Product product) {
        productMap.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return  productMap.get(id);
    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id,product);
    }

    @Override
    public void delete(int id) {
        productMap.remove(id);
    }

    @Override
    public List<Product> findByName(String name, List<Product> productList) {
        return null;
    }
}
