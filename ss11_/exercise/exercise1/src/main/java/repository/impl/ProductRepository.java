package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
        private static Map<Integer,Product> products = new HashMap<>();
        static {
            products.put(1,new Product(1,"Dép",20000.0,"màu đỏ","Nike"));
            products.put(2,new Product(2,"Áo",50000.0,"màu xanh","Adidas"));
            products.put(3,new Product(3,"Quần",70000.0,"màu vàng","Gucci"));
            products.put(4,new Product(4,"Điện thoại",1202000.0,"xách tay","Apple"));
            products.put(5,new Product(5,"Laptop",8000000.0,"cũ","Dell"));
        }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void add(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public void edit(int id, Product product) {
        products.put(id,product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public String displayProductDetail(int id) {
        return products.get(id).getDescribe();
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> productList = new ArrayList<>();
        for (Product p:products.values()){
            if (p.getName().toLowerCase().contains(name.toLowerCase())){
                productList.add(p);
            }
        }
        return productList;
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }
}
