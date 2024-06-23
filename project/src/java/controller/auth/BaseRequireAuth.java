/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.auth;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Feature;
import model.Role;
import model.User;

/**
 *
 * @author KEISHA
 */
public abstract class BaseRequireAuth extends HttpServlet {

    private boolean isAuthen(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            return false;
        } else {
            String currentURL = request.getServletPath();
            for (Role role : user.getRoles()) {
                for (Feature feature : role.getFeatures()) {
                    if (feature.getUrl().equals(currentURL)) {
                        return true;
                    }
                }
            }
            return false;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (isAuthen(request)) {
            doGet(request, response, user);
        } else {
            response.getWriter().println("Access denied!");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (isAuthen(request)) {
            doPost(request, response, user);
        } else {
            response.getWriter().println("Access denied!");
        }
    }

    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException;

    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException;

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
