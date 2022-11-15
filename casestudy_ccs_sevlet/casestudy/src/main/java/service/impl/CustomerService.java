package service.impl;

import model.person.Customer;
import repository.ICustomerRepository;
import repository.IFacilityRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> selectAllCustomer() {
        return this.customerRepository.selectAllCustomer();
    }

    @Override
    public void addNewCustomer(Customer customer) {
    this.customerRepository.addNewCustomer(customer);
    }

    @Override
    public boolean deleteCustomer(int idDelete) {
       return customerRepository.deleteCustomer(idDelete);
    }

    @Override
    public Customer findCustomerById(int idSearch) {
        return this.customerRepository.findCustomerById(idSearch);
    }

    @Override
    public void editCustomer(Customer customer) {
    this.customerRepository.editCustomer(customer);
    }

    @Override
    public List<Customer> searchCustomer(String keySearch) {
        return this.customerRepository.searchCustomer(keySearch);
    }
}
