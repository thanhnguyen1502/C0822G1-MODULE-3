package controller;

import model.model.person.Employee;
import service.IEmployeeService;
import service.impl.EmployeeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "EmployeeFuramaServlet", value = "/EmployeeFurama")
public class EmployeeServlet extends HttpServlet {
    private IEmployeeService employeeService = new EmployeeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "addNewEmployee":
                showAddEmployee(request,response);
                break;
            default:
                showEmployeeListPage(request,response);
        }
    }




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "deleteEmployee":
                deleteEmployee(request,response);
                break;
            case "addNewEmployee":
                addNewEmployee(request, response);
                break;
        }
    }
    private void addNewEmployee(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("nameOfEmployee");
        LocalDate birthDay = LocalDate.parse(request.getParameter("dateOfBirth"));
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phoneNumber =request.getParameter("numberPhone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String position = request.getParameter("position");
        String education = request.getParameter("educationDegree");
        String division = request.getParameter("division");
        Employee employee = new Employee(name,birthDay,idCard,salary,phoneNumber,email,address,position,education,division);
        this.employeeService.addNewEmployee(employee);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        request.setAttribute("message", "successfully added new");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteEmployeeId"));
        this.employeeService.deleteEmployee(id);
        try {
            response.sendRedirect("/EmployeeFurama");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void showEmployeeListPage(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.selectAllEmployee();

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        request.setAttribute("employeeList", employeeList);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void showAddEmployee(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
