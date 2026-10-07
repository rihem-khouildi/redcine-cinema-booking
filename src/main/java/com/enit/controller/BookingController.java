package com.enit.controller;
import java.io.IOException;
import com.enit.entities.Seance;
import com.enit.service.Cinema;
import com.enit.service.Utilisateur;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BookingController")
public class BookingController extends HttpServlet {
    @EJB
    private Cinema cinemaService;
    @EJB
    private Utilisateur userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve session ID from request
            int sessionId = Integer.parseInt(request.getParameter("sessionId"));
            int movieId = Integer.parseInt(request.getParameter("movieId"));
            // Log the parameters for debugging
            System.out.println("sessionId: " + sessionId);
            System.out.println("movieId: " + movieId);

            // Fetch the session details
            Seance seance = cinemaService.findSession(sessionId);
            if (seance == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Session not found");
                return;
            }

            // Set the session as a request attribute
            request.setAttribute("session", seance);
            request.setAttribute("movieId", movieId);

            // Forward to booking.jsp
            request.getRequestDispatcher("Booking.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid session ID");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred");
        	}
        }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve form parameters
            String sessionIdParam = request.getParameter("sessionId");
            String numberOfSeatsParam = request.getParameter("seats");
            String ticketPriceParam = request.getParameter("ticketPrice");

            if (sessionIdParam == null || numberOfSeatsParam == null) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing form parameters");
                return;
            }

            // Default value for ticketPrice
            double ticketPrice = 10.0; // Default price
            if (ticketPriceParam != null && !ticketPriceParam.isEmpty()) {
                try {
                    ticketPrice = Double.parseDouble(ticketPriceParam); // Only change if a valid price is provided
                } catch (NumberFormatException e) {
                    System.out.println("Invalid ticket price, using default: " + ticketPrice);
                }
            } else {
                System.out.println("Ticket price not provided, using default: " + ticketPrice);
            }

            // Convert other parameters
            int sessionId = Integer.parseInt(sessionIdParam);
            int numberOfSeats = Integer.parseInt(numberOfSeatsParam);

            // Fetch the session details (fetch the price from the session)
            Seance seance = cinemaService.findSession(sessionId);
            if (seance == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Session not found");
                return;
            }

            // Use the session's ticket price if it's not the default
            if (ticketPrice == 10.0) {
                ticketPrice = seance.getTarif();  // Get the price from the session if not set manually
                System.out.println("Ticket price from session: " + ticketPrice);
            }

            // Validate the number of seats
            if (numberOfSeats <= 0 || numberOfSeats > seance.getPlaces()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number of seats");
                return;
            }

            // Calculate total price
            double totalPrice = numberOfSeats * ticketPrice;
            System.out.println("Total price: " + totalPrice);
            System.out.println("fetching user id " );
            
            

            // Fetch the user ID from the session
            Long userId = (Long) request.getSession().getAttribute("userId");
            if (userId == null) {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
                System.out.println("can't get user id " );
           
                return;
            }
            System.out.println("userId: " + userId);

            // Convert userId to String if needed
            String userIdStr = String.valueOf(userId);

            // Process payment
            boolean paymentSuccess = userService.processPayment(userIdStr, totalPrice);
            if (!paymentSuccess) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Insufficient balance");
                return;
            }

            // Book seats
            boolean bookingSuccess = cinemaService.bookSeats(sessionId, numberOfSeats);
            if (!bookingSuccess) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Booking failed");
                return;
            }

            // Redirect to confirmation page
            response.sendRedirect("Confirmation.jsp?sessionId=" + sessionId + "&seats=" + numberOfSeats);
            System.out.println("sessionId: " + sessionId);
            System.out.println("seats: " + numberOfSeats);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input");
        } catch (Exception e) {
            e.printStackTrace(); // Logs the full exception details
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred: " + e.getMessage());
        }
    }


 
 }
    
    
    
   
