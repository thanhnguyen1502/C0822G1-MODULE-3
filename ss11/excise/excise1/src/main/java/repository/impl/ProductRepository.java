package repository.impl;

import model.Product;
import repository.IProductRepository;


import java.util.*;

public class ProductRepository implements IProductRepository {
    private static Map<Integer,Product> productMap = new HashMap<>();

    static {
        productMap.put(1,new Product(1, "Iphone 8","Apple", 5000, "new", "https://cdn.tgdd.vn/Products/Images/42/114113/iphone-8-64gb-hh-600x600.jpg"));
        productMap.put(2,new Product(2, "Iphone x","Apple", 5000, "new", "https://cdn.tgdd.vn/Products/Images/42/114115/iphone-x-64gb-hh-600x600.jpg"));
        productMap.put(3,new Product(3, "Iphone 11","Apple", 5000, "new", "https://cdn.hoanghamobile.com/i/preview/Uploads/2020/09/17/apple-iphone-11-64gb-6.1.jpg"));
        productMap.put(4,new Product(4, "Iphone 12","Apple", 5000, "new", "https://cdn.hoanghamobile.com/i/preview/Uploads/2020/11/06/iphone-12-pro-max-2.png"));
        productMap.put(5,new Product(5, "Iphone 13","Apple", 5000, "new", "https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2021/09/15/image-removebg-preview-15.png"));
    }

    @Override
    public List<Product> display() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void save(Product product) {
        productMap.put(product.getId(),product);
    }

    @Override
    public Product findByID(int id) {
        return productMap.get(id);
    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id, product);
    }

    @Override
    public void delete(int id) {
        productMap.remove(id);
    }

    @Override
    public Product seeDetails() {
        return null;
    }

    @Override
    public List<Product> findByName(String name, List<Product> products) {
        List<Product> productList = new ArrayList<>();
        for (Product product : products) {
            if (product.getName().toLowerCase().contains(name.toLowerCase())) {
                productList.add(product);
            }
        }
        return  productList;
    }
}
