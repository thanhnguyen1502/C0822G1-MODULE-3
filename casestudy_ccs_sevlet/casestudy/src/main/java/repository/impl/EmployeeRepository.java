package repository.impl;

import model.person.Employee;
import repository.IEmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private final String SELECT_ALL = "select e.*, p.name as posision_name , ed.name as education_degree_name, d.name as division_name from furama_management.employee e " +
            "join furama_management.position p on e.position_id = p.id " +
            "join furama_management.education_degree ed on e.education_degree_id = ed.id\n" +
            "join furama_management.division d on e.division_id = d.id where `status` = 1";
    private final String DELETE_ID = "update employee set `status` = 0 where id = ?;";

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
                String position = resultSet.getString("posision_name");
                String education = resultSet.getString("education_degree_name");
                String division = resultSet.getString("division_name");
                employee = new Employee(name,birthDay,idCard,salary,phone,email,address,position,education,division);
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public boolean deleteEmployee(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ID);
            preparedStatement.setInt(1,id);
            int num = preparedStatement.executeUpdate();
            return num == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


}
