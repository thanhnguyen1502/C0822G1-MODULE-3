package controller;

import service.IUserService;
import service.impl.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserServlet", value = "/UserServlet")
public class UserServlet extends HttpServlet {
    private IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            case "sortByName":
                sortByName(request,response);
            case "permision":
                addUserPermision(request, response);
                break;
            case "test-without-tran":
                testWithoutTran(request, response);
                break;
            case "test-use-tran":
                testUseTran(request, response);
                break;
            default:
                listUser(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                insertUser(request, response);
                break;
            case "edit":
                updateUser(request, response);
                break;
            case "searchByCountry":
                searchByCountry(request,response);
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) {
    }

    private void testUseTran(HttpServletRequest request, HttpServletResponse response) {
        userService.insertUpdateUseTransaction();
    }

    private void testWithoutTran(HttpServletRequest request, HttpServletResponse response) {
        userService.insertUpdateWithoutTransaction();

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/user/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void addUserPermision(HttpServletRequest request, HttpServletResponse response) {
    }

    private void sortByName(HttpServletRequest request, HttpServletResponse response) {
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
    }



    private void searchByCountry(HttpServletRequest request, HttpServletResponse response) {
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) {
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) {
    }
}
