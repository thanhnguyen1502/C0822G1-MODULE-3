package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {

    List<Product> display();

    void save(Product product);

    Product findByID(int id);

    void update(int id, Product product);

    void delete(int id);

    Product seeDetails();

    List<Product> findByName(String name, List<Product> products);

}