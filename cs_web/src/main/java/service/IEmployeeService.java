package service;

import model.model.person.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> selectAllEmployee();
    boolean deleteEmployee(int id);
    void addNewEmployee(Employee employee);
}
