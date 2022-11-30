package controller;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ControllerServlet", value = "/customer")
public class ControllerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Long","03/08/1998","Huế","https://kenh14cdn.com/203336854389633024/2021/5/7/photo-1-1620357519578885309410.jpg"));
        customerList.add(new Customer("Duyên","03/09/1998","ĐN","https://kenh14cdn.com/203336854389633024/2021/5/7/photo-1-1620357521007570953168.jpg"));
        customerList.add(new Customer("Trang","03/20/1998","Quảng Trị","https://photo-cms-kienthuc.epicdn.me/zoom/800/uploaded/hongngan/2022_07_15/g/me-dam-hot-girl-xinh-dep-hoa-mieu-nu-sexy-hut-van-anh-nhin-hinh-4.jpg"));
        customerList.add(new Customer("Phúc","03/12/1998","ĐN","https://thethao99.com/wp-content/uploads/2021/07/nguoidepeuro-3-768x1024.jpg"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("view/list.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
