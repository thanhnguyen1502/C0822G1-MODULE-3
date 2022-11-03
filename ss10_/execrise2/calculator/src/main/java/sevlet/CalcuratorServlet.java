package sevlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalcuratorServlet", value = "/calculator")
public class CalcuratorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double firstOperand = Double.parseDouble(request.getParameter("firstOperand"));
        String operator = request.getParameter("operator");
        double secondOperand = Double.parseDouble(request.getParameter("secondOperand"));

        String result = "";
        switch (operator) {
            case "+":
                result = String.valueOf((firstOperand + secondOperand));
                break;
            case "-":
                result = String.valueOf((firstOperand - secondOperand));
                break;
            case "*":
                result = String.valueOf(firstOperand * secondOperand);
                break;
            case "/": {
                if (secondOperand != 0) {
                    result = String.valueOf((firstOperand / secondOperand));
                    break;
                } else {
                    try {
                        throw new ArithmeticException("cannot be divided by 0");
                    } catch (Exception e) {
                        result = e.getMessage();
                    }
                }
            }
        }
        request.setAttribute("result",result);
        request.getRequestDispatcher("index.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
