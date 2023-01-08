package repository;


import model.model.person.Customer;

import java.util.List;

public interface ICustomerRepository {

    List<Customer> selectAllCustomer();

    void addNewCustomer(Customer customer);

    boolean deleteCustomer(int id);

    Customer findCustomerById(int idSearch);

    void editCustomer(Customer customer);

    List<Customer> searchCustomer(String keySearch);
}
