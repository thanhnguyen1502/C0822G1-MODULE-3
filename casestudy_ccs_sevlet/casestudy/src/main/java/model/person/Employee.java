package model.person;

import java.time.LocalDate;

public class Employee extends Person{
    private String employeeID;
    private String academyLevel;
    private String position;
    private String salary;

    public Employee() {
    }

    public Employee(String employeeID, String academyLevel, String position, String salary) {
        this.employeeID = employeeID;
        this.academyLevel = academyLevel;
        this.position = position;
        this.salary = salary;
    }

    public Employee(String name, LocalDate birthday, boolean gender, String id, String phoneNumber, String email, String employeeID, String academyLevel, String position, String salary) {
        super(name, birthday, gender, id, phoneNumber, email);
        this.employeeID = employeeID;
        this.academyLevel = academyLevel;
        this.position = position;
        this.salary = salary;
    }

    public String getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(String employeeID) {
        this.employeeID = employeeID;
    }

    public String getAcademyLevel() {
        return academyLevel;
    }

    public void setAcademyLevel(String academyLevel) {
        this.academyLevel = academyLevel;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }
}
