import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double firstOperand = Double.parseDouble(request.getParameter("firstOperand"));
        String operand = request.getParameter("operand");
        double secoundOperand = Double.parseDouble(request.getParameter("secoundOperand"));

        String result = "";
        switch (operand) {
            case "+":
                result = String.valueOf(firstOperand + secoundOperand);
                break;
            case "-":
                result = String.valueOf(firstOperand - secoundOperand);
                break;
            case "*":
                result = String.valueOf(firstOperand * secoundOperand);
                break;
            case "/":
                if (secoundOperand != 0) {
                    result = String.valueOf(firstOperand / secoundOperand);
                } else{
                    try {
                        throw new ArithmeticException("cannot be divided by 0");
                    } catch (Exception e) {
                        result = e.getMessage();
                    }
                }
        }
        request.setAttribute("result", result);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
