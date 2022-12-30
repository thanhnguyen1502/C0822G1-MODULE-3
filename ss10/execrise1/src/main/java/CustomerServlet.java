import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();
    static{
        customerList.add(new Customer("Thành","03/08/1998","Huế","https://vcdn1-giaitri.vnecdn.net/2022/07/06/Minions-The-Rise-of-Gru-3967-1657075774.jpg?w=0&h=0&q=100&dpr=2&fit=crop&s=cPcuum7fqVr43rO4QSNmQw"));
        customerList.add(new Customer("Long","03/08/1998","Huế","https://kenh14cdn.com/203336854389633024/2021/5/7/photo-1-1620357519578885309410.jpg"));
        customerList.add(new Customer("Phi","03/08/1998","Huế","https://kenh14cdn.com/203336854389633024/2021/5/7/photo-1-1620357519578885309410.jpg"));
        customerList.add(new Customer("Mạnh","03/08/1998","Huế","https://kenh14cdn.com/203336854389633024/2021/5/7/photo-1-1620357519578885309410.jpg"));
        customerList.add(new Customer("Cường","03/08/1998","Huế","https://kenh14cdn.com/203336854389633024/2021/5/7/photo-1-1620357519578885309410.jpg"));

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
