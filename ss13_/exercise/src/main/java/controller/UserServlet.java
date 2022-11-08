package controller;

import model.User;
import service.IUserService;
import service.impl.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

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
                sortByName(request, response);
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
                searchByCountry(request, response);
        }
    }

    private void testUseTran(HttpServletRequest request, HttpServletResponse response) {
        userService.insertUpdateUseTransaction();
    }

    private void testWithoutTran(HttpServletRequest request, HttpServletResponse response) {
        userService.insertUpdateWithoutTransaction();

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // BÀI TẬP 2:
    private void addUserPermision(HttpServletRequest request, HttpServletResponse response) {
        User user = new User("quan", "quan.nguyen@codegym.vn", "vn");

        int[] permision = {1, 2, 3};

        userService.addUserTransaction(user, permision);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void sortByName(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = this.userService.sortByName();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/list.jsp");
        request.setAttribute("userList", userList);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void searchByCountry(HttpServletRequest request, HttpServletResponse response) {
        String countrySearch = request.getParameter("countrySearch");
        List<User> userList = this.userService.selectByCountry(countrySearch);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/list.jsp");
        request.setAttribute("userList", userList);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        User user = new User(id, name, email, country);
        try {
//            this.userService.updateUser(user);

//            BÀI TẬP 1:
            this.userService.updateUserStore(user);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/edit.jsp");
            request.setAttribute("message", "edit successfully");
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
//        User existingUser = userService.selectUser(id);
        User existingUser = userService.getUserById(id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/edit.jsp");
        request.setAttribute("user", existingUser);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
//            this.userService.deleteUser(id);

//            BÀI TẬP 1:
            this.userService.deleteUserStore(id);

            List<User> userList = this.userService.selectAllUsers();
            request.setAttribute("userList",userList);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/list.jsp");
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        User user = new User(name, email, country);
        try {
//            userService.insertUser(user);
            userService.insertUserStore(user);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/create.jsp");
            request.setAttribute("message","Successfully added new");
            requestDispatcher.forward(request,response);
            listUser(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }




    private void listUser(HttpServletRequest request, HttpServletResponse response) {
//        List<User> userList = this.userService.selectAllUsers();

//        BÀI TẬP 1:
        List<User> userList = this.userService.listUserStore();

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/list.jsp");
        request.setAttribute("userList", userList);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
