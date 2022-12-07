package controller;

import model.person.Customer;
import service.ICustomerService;
import service.impl.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@WebServlet(name = "CustomerFuramaServlet", value = "/CustomerFurama")
public class CustomerFuramaServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "addNewCustomer":
                showAddNewCustomerForm(request, response);
                break;
            case "editCustomer":
                showEditCustomerForm(request, response);
                break;
            case "contractList":
                showContractPage(request, response);
                break;
            default:
                showCustomerListPage(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "addNewCustomer":
                addNewCustomer(request, response);
                break;
            case "deleteCustomer":
                deleteCustomer(request, response);
                break;
            case "updateCustomer":
                updateCustomer(request, response);
                break;
            case "searchCustomer":
                searchCustomer(request,response);
                break;
        }
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) {
        String keySearch = request.getParameter("keySearch");

        List<Customer> customerList = this.customerService.searchCustomer(keySearch);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        request.setAttribute("customerList",customerList);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("nameCustomer");
        LocalDate birthDay = LocalDate.parse(request.getParameter("birthDayCustomer"));
        boolean genderCustomer = Boolean.parseBoolean(request.getParameter("genderCustomer"));
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneCustomer");
        String email = request.getParameter("emailCustomer");
        String customerType = request.getParameter("customerType");
        String address = request.getParameter("customerAddress");

        Customer customer = new Customer(name, birthDay, genderCustomer, idCard, phoneNumber, email, id, customerType, address);

        this.customerService.editCustomer(customer);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/edit.jsp");
        request.setAttribute("message", "Update successful");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditCustomerForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.findCustomerById(id);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/edit.jsp");
        request.setAttribute("customer", customer);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteCustomerId"));
        this.customerService.deleteCustomer(id);

        try {
            response.sendRedirect("/CustomerFurama");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void addNewCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("nameCustomer");
        LocalDate birthDay = LocalDate.parse(request.getParameter("birthDayCustomer"));
        boolean gender = Boolean.parseBoolean(request.getParameter("genderCustomer"));
        String idCard = request.getParameter("idCard");
        String phoneNumber =request.getParameter("phoneCustomer");
        String email = request.getParameter("emailCustomer");
        String customerType = request.getParameter("customerType");
        String address = request.getParameter("customerAddress");
        Customer customer = new Customer(name, birthDay, gender, idCard, phoneNumber, email, customerType, address);
        this.customerService.addNewCustomer(customer);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/customer/create.jsp");
        request.setAttribute("message", "successfully added new");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        showCustomerListPage(request, response);
    }

    private void showAddNewCustomerForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/customer/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void showContractPage(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/contract/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCustomerListPage(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.selectAllCustomer();

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/customer/list.jsp");
        request.setAttribute("customerList", customerList);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
