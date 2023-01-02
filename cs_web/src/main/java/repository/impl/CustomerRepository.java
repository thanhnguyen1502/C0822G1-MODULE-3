package repository.impl;

import controller.CustomerServlet;
import model.Customer;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private String SELECT_ALL_CUSTOMER= "select c.*, ct.name as customer_type from customer c join customer_type ct on c.customer_type_id = ct.id where `status` = 1;";
    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
       Customer customer = null;

        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet resultSet =preparedStatement.executeQuery();
            while (resultSet.next()){
                int customerId = resultSet.getInt("id");
                String typeCustomer = resultSet.getString("customer_type");
                String name = resultSet.getString("name");
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
}
