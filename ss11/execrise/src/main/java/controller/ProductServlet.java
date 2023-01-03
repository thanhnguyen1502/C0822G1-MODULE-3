package controller;

import Model.Product;
import Service.IProductService;
import Service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/Products")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action){
            case "create":
                showCreateForm(request, response);
                break;
            case "delete":
                deleteProduct(request,response);
                break;
            case "update":
                showEditForm(request, response);
                break;
            default:
                showList(request,response);
        }
    }




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action==null){
            action = "";
        }

        switch (action){
            case "create":
            createProduct(request,response);
            break;
            case "update":
                updateProduct(request,response);
                break;
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String status = request.getParameter("status");
        String producer = request.getParameter("producer");

        Product product = this.productService.findById(id);
        RequestDispatcher requestDispatcher;
        if (product == null){
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        }else {
            product.setName(name);
            product.setPrice(price);
            product.setStatus(status);
            product.setProducer(producer);
            this.productService.update(id,product);
            request.setAttribute("product",product);
            request.setAttribute("message","Product information was updated");
            requestDispatcher = request.getRequestDispatcher("view/edit.jsp");
        }
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);

        RequestDispatcher requestDispatcher;
        if (product == null){
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        }else {
            request.setAttribute("product",product);
            requestDispatcher = request.getRequestDispatcher("view/edit.jsp");
        }

        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.findAll();
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("prince"));
        String status = request.getParameter("status");
        String producer = request.getParameter("producer");
        int id = productList.get(productList.size() - 1).getId() + 1;

        Product product = new Product(id,name,price,status,producer);
        productService.save(product);

        RequestDispatcher requestDispatcher =request.getRequestDispatcher("view/create.jsp");
        request.setAttribute("message", "New product was created");
        showList(request,response);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.findAll();
        request.setAttribute("productList", productList);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/list.jsp");

        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/create.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);

        RequestDispatcher requestDispatcher;
        if (product == null){
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        }else {
            this.productService.delete(id);
            try {
                response.sendRedirect("/Products");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
