package service;

import model.Product;

import java.util.List;

public interface IProductService {

    List<Product> display();

    void save(Product product);

    Product findByID(int id);

    void update(int id, Product product);

    void delete(int id);

    Product seeDetails();

    List<Product> findByName(String name, List<Product> products);

}