package org.example.e_commerce_web_application_assignment_01.AdminFeatures.Cart;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.e_commerce_web_application_assignment_01.DTO.CartItem;
import org.example.e_commerce_web_application_assignment_01.DTO.Order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private List<CartItem> cart = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart",  cart);
        }

        req.setAttribute("cart", cart);
        RequestDispatcher dispatcher = req.getRequestDispatcher("cart.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("addToCart".equals(action)) {
            int product_id = Integer.parseInt(req.getParameter("product_id"));
            String product_name = req.getParameter("product_name");
            double price = Double.parseDouble(req.getParameter("price"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));

            CartItem newItem = new CartItem(product_id, product_name, price, quantity);
            HttpSession session = req.getSession();
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

            if (cart == null) {
                cart = new ArrayList<>();
                session.setAttribute("cart", cart);
            }

            cart.add(newItem);

            resp.setContentType("application/json");
            resp.getWriter().write("{\"status\":\"success\"}");
        } else if ("placeOrder".equals(action)) {
            HttpSession session = req.getSession();
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

            if (cart != null && !cart.isEmpty()) {
                int user_id = Integer.parseInt(req.getParameter("user_id"));
                Order order = new Order(user_id, cart);

                cart.clear();

                resp.sendRedirect("orderConfirmation.jsp");
            }

        }

    }
}


































