package repository.impl;

import model.person.Employee;
import repository.IEmployeeRepository;

import javax.servlet.RequestDispatcher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private final String SELECT_ALL = "select * from furama_management.employee;";
    @Override
    public List<Employee> selectAllEmployee() {
        List<Employee> employeeList = new ArrayList<>();
        Employee employee = null;

        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){

                String name = resultSet.getString("name");
                LocalDate birthDay = LocalDate.parse(resultSet.getString("date_of_birth"));
                String idCard = resultSet.getString("id_card");
                double salary = resultSet.getDouble("salary");
                String phone = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                String position = resultSet.getString("position_id");
                String education = resultSet.getString("education_degree_id");
                String division = resultSet.getString("division_id");
                employee = new Employee(name,birthDay,idCard,salary,phone,email,address,position,education,division);
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }
}
