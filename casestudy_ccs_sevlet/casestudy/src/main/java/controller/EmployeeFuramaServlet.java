package controller;

import model.person.Employee;
import service.IEmployeeService;
import service.impl.EmployeeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "EmployeeFuramaServlet", value = "/EmployeeFurama")
public class EmployeeFuramaServlet extends HttpServlet {
    private IEmployeeService employeeService = new EmployeeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "addEmployee0":
//                showListAddEmployee(request,response);
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
}
