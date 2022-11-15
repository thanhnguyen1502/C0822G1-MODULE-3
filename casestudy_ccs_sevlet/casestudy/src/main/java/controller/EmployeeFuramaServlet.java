package controller;

import model.person.Employee;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "EmployeeFuramaServlet", value = "/employeeFurama")
public class EmployeeFuramaServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = null;
        }
        switch (action) {
            default:
                showCustomerListPage(request,response);
        }
    }

    private void showCustomerListPage(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = new ArrayList<>();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
