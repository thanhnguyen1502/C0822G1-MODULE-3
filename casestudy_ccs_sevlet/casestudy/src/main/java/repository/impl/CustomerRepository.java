package repository.impl;

import model.person.Customer;
import repository.ICustomerRepository;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private final String SELECT_ALL_CUSTOMER = "CALL customer_list();";
    private final String ADD_NEW_CUSTOMER = "CALL add_new_customer(?,?,?,?,?,?,?,?);";
    private final String DELETE_CUSTOMER = "CALL delete_customer(?);";
    private final String FIND_CUSTOMER_BY_ID = "CALL find_customer_by_id(?);";
    private final String EDIT_CUSTOMER = "CALL edit_customer(?,?,?,?,?,?,?,?,?);";
    private final String SEARCH_CUSTOMER = "CALL find_customer(?);";


    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
        Customer customer = null;

        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_CUSTOMER);
            callableStatement.executeQuery();
            ResultSet resultSet = callableStatement.getResultSet();
            while (resultSet.next()) {
                int customerId = resultSet.getInt("id");
                String typeCustomer = resultSet.getString("customer_type");
                String name = resultSet.getString("customer_name");
                LocalDate birthDay = LocalDate.parse(resultSet.getString("date_of_birth"));
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String phone = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                customer = new Customer(name, birthDay, gender, idCard, phone, email, customerId, typeCustomer, address);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public void addNewCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();

        try {
            CallableStatement callableStatement = connection.prepareCall(ADD_NEW_CUSTOMER);
            callableStatement.setInt(1, Integer.parseInt(customer.getCustomerType()));
            callableStatement.setString(2, customer.getName());
            callableStatement.setDate(3, Date.valueOf(customer.getBirthday()));
            callableStatement.setBoolean(4, customer.getGender());
            callableStatement.setString(5, customer.getId());
            callableStatement.setString(6, customer.getPhoneNumber());
            callableStatement.setString(7, customer.getEmail());
            callableStatement.setString(8, customer.getAddress());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteCustomer(int id) {
        Connection connection = BaseRepository.getConnectDB();

        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_CUSTOMER);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Customer findCustomerById(int idSearch) {
        Customer customer = null;

        Connection connection = BaseRepository.getConnectDB();

        try {
            CallableStatement callableStatement = connection.prepareCall(FIND_CUSTOMER_BY_ID);
            callableStatement.setInt(1, idSearch);
            callableStatement.executeQuery();
            ResultSet resultSet = callableStatement.getResultSet();
            while (resultSet.next()) {
                String name = resultSet.getString("customer_name");
                LocalDate birthDay = LocalDate.parse(resultSet.getString("date_of_birth"));
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String phone = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                int customerId = resultSet.getInt("id");
                String customerType = resultSet.getString("customer_type");
                String address = resultSet.getString("address");
                customer = new Customer(name, birthDay, gender, idCard, phone, email, customerId, customerType, address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public void editCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();

        try {
            CallableStatement callableStatement = connection.prepareCall(EDIT_CUSTOMER);
            callableStatement.setInt(1, customer.getCustomerID());
            callableStatement.setInt(2, Integer.parseInt(customer.getCustomerType()));
            callableStatement.setString(3, customer.getName());
            callableStatement.setDate(4, Date.valueOf(customer.getBirthday()));
            callableStatement.setBoolean(5, customer.getGender());
            callableStatement.setString(6, customer.getId());
            callableStatement.setString(7, customer.getPhoneNumber());
            callableStatement.setString(8, customer.getEmail());
            callableStatement.setString(9, customer.getAddress());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Customer> searchCustomer(String keySearch) {
        List<Customer> customerList = new ArrayList<>();
        Customer customer = null;

        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(SEARCH_CUSTOMER);
            callableStatement.setString(1, keySearch);
            callableStatement.executeQuery();
            ResultSet resultSet = callableStatement.getResultSet();
            while (resultSet.next()){
                String name = resultSet.getString("customer_name");
                LocalDate birthDay = LocalDate.parse(resultSet.getString("date_of_birth"));
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String phone = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                int customerId = resultSet.getInt("id");
                String customerType = resultSet.getString("customer_type");
                String address = resultSet.getString("address");
                customer = new Customer(name, birthDay, gender, idCard, phone, email, customerId, customerType, address);
                customerList.add(customer);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customerList;
    }
}
