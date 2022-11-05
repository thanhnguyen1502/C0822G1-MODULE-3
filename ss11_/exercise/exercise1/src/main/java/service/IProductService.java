package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void add(Product product);

    void edit(int id, Product product);

    void remove(int id);

    String displayProductDetail(int id);

    List<Product> findByName(String name);

    Product findById(int id);

}
