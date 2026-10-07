package com.enit.controller;

import java.io.IOException;

import com.enit.service.SoldeNegatifException;
import com.enit.service.Utilisateur;
import com.enit.service.UserNotFoundException;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user")
public class UtilisateurController extends HttpServlet {
    @EJB
    private Utilisateur userService;

    // Handle GET requests (actions like home, checkBalance)
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action == null) {
            action = "home"; // Default action
        }

        switch (action) {
            case "home":
                // Check if the user is logged in via session
                HttpSession session = request.getSession(false);
                if (session != null && session.getAttribute("username") != null) {
                    request.getRequestDispatcher("/Home.jsp").forward(request, response);
                } else {
                    response.sendRedirect("/Login.jsp"); // Redirect to login page if not logged in
                }
                break;
            case "checkBalance":
                try {
                    float solde = userService.solde();
                    request.setAttribute("solde", solde);
                    request.getRequestDispatcher("/balance.jsp").forward(request, response);
                } catch (UserNotFoundException e) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found");
                } catch (SoldeNegatifException e) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Votre solde est négatif.");
                }
                break;
            case "logout":
                // Logout functionality
                HttpSession sessionLogout = request.getSession(false);
                if (sessionLogout != null) {
                    sessionLogout.invalidate(); // Invalidate the session
                }
                response.sendRedirect("/Login.jsp"); // Redirect to login page after logout
                break;
            // Add more cases for other actions (like debit)
        }
    }

    
 // Handle POST requests (for login and other form submissions)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("username");
        String password = request.getParameter("password");
        String action = request.getParameter("action");
        if (action == null) {
            action = "home"; // Default action
        }
        
        switch (action) {
        case "login":
          try {
            userService.init(name, password); // Authenticate the user
            // Retrieve the user ID (assuming userService has a method to get the user ID)
            Long userId = userService.getUserId(name); // Retrieve user ID based on the us

            // Store user information in session to maintain logged-in state
            HttpSession session = request.getSession();
            session.setAttribute("username", name);
            session.setAttribute("userId", userId);

            // Redirect to UserHomePage.jsp after successful login
            response.sendRedirect(request.getContextPath() + "/UserHomePage.jsp");
            } catch (UserNotFoundException e) {
            // In case of invalid credentials, set the error message and forward to the login page
            request.setAttribute("errorMessage", "Invalid credentials");
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
             }
        break;
        
        case "signup":
            try {
                userService.createAccount(name, password); // Create the user account

                // Set a success message in the session
                HttpSession session = request.getSession();
                session.setAttribute("successMessage", "Account created successfully! Welcome, " + name + ".");

                // Redirect to the Home page
                response.sendRedirect(request.getContextPath() + "/Home.jsp");
            } catch (Exception e) {
                // Set an error message in case of failure
                request.setAttribute("errorMessage", "Account creation failed. Please try again.");
                request.getRequestDispatcher("/signup.jsp").forward(request, response);
            }
            break;
        }}}

    

    



