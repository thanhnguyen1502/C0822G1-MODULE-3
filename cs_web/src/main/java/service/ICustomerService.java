package service;


import model.model.person.Customer;

import java.util.List;

public interface ICustomerService {

    List<Customer> selectAllCustomer();

    void addNewCustomer(Customer customer);

    boolean deleteCustomer(int id);

    Customer findCustomerById(int idSearch);

    void editCustomer(Customer customer);

    List<Customer> searchCustomer(String keySearch);
}
