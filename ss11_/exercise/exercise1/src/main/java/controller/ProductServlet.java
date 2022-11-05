package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        switch (action) {
            case "add":
                showAddForm(request, response);
                break;
            case "display":
                showListForm(request, response);
                break;
            case "find":
                finByName(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "remove":
                removeProduct(request, response);
                break;
            case "detail":
                showProductDetail(request, response);
                break;
            default:

        }

    }

    private void showProductDetail(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String detail = productService.displayProductDetail(id);
        request.setAttribute("detail", detail);
        request.setAttribute("id", id);
        showListForm(request, response);
    }

    private void removeProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.remove(id);
        showListForm(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);

        request.setAttribute("product", product);

        try {
            request.getRequestDispatcher("view/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void finByName(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        List<Product> products = productService.findByName(name);
        RequestDispatcher dispatcher;

        if (products.size() == 0) {
            request.setAttribute("result", "Not found");
            dispatcher = request.getRequestDispatcher("index.jsp");
        } else {
            request.setAttribute("productList", products);
            dispatcher = request.getRequestDispatcher("view/list.jsp");
        }

        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListForm(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.findAll();
        try {
            request.getRequestDispatcher("view/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/add.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        switch (action) {
            case "add":
                addNewProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
            default:
        }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));

        String name = request.getParameter("name");

        double price = Double.parseDouble(request.getParameter("price"));

        String description = request.getParameter("description");

        String producer = request.getParameter("producer");

        Product product = new Product(id, name, price, description, producer);

        productService.edit(id, product);

        showListForm(request, response);
    }

    private void addNewProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");

        double price = Double.parseDouble(request.getParameter("price"));

        String description = request.getParameter("description");

        String producer = request.getParameter("producer");

        List<Product> productList = productService.findAll();

        int id = productList.get(productList.size() - 1).getId() + 1;

        Product newProduct = new Product(id, name, price, description, producer);

        productService.add(newProduct);


        request.setAttribute("response", "Product has been added");
        try {
            request.getRequestDispatcher("view/add.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}

