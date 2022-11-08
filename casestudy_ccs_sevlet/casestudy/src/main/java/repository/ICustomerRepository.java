package repository;

import model.person.Customer;

import java.util.List;

public interface ICustomerRepository {

    List<Customer> selectAllCustomer();

    void addNewCustomer(Customer customer);

    void deleteCustomer(int id);

    Customer findCustomerById(int idSearch);

    void editCustomer(Customer customer);

    List<Customer> searchCustomer(String keySearch);
}
