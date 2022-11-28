package repository;

import model.person.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();

}
