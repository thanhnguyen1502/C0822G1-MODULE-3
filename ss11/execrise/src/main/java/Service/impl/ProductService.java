package Service.impl;

import Model.Product;
import Repository.IProductRepository;
import Repository.impl.ProductRepository;
import Service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void save(Product product) {
        productRepository.save(product);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public void update(int id, Product product) {
        productRepository.update(id,product);
    }

    @Override
    public void delete(int id) {
        productRepository.delete(id);
    }

    @Override
    public List<Product> findByName(String name, List<Product> productList) {
        return productRepository.findByName(name, productList);
    }
}
