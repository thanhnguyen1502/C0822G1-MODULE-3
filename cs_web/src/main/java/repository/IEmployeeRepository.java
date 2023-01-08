package repository;


import model.model.person.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> selectAllEmployee();
    boolean deleteEmployee(int id);
    void addNewEmployee(Employee employee);
}
