package org.example.e_commerce_web_application_assignment_01.AdminFeatures.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.e_commerce_web_application_assignment_01.sketch.CartHandle;

import java.io.IOException;

@WebServlet(name = "UpdateCartServlet", value = "/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int product_id = Integer.parseInt(req.getParameter("product_id"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        CartHandle cart = (CartHandle) req.getSession().getAttribute("cart");
        if (cart != null) {
            cart.updatedItemQuantity(product_id, quantity);
        }


        resp.sendRedirect("DisplayCart.jsp");
    }
}
