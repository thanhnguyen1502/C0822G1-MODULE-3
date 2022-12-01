package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.*;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> display() {
        return this.productRepository.display();
    }

    @Override
    public void save(Product product) {
        this.productRepository.save(product);
    }

    @Override
    public Product findByID(int id) {
        return this.productRepository.findByID(id);
    }

    @Override
    public void update(int id, Product product) {
        this.productRepository.update(id,product);
    }

    @Override
    public void delete(int id) {
        this.productRepository.delete(id);
    }

    @Override
    public Product seeDetails() {
        return null;
    }

    @Override
    public List<Product> findByName(String name, List<Product> products) {
        return this.productRepository.findByName(name, products);
    }
}