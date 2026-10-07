package com.enit.controller;

import java.io.IOException;
import java.util.List;

import com.enit.entities.Film;
import com.enit.entities.Seance;
import com.enit.service.Cinema;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/sessions")
public class SeanceController extends HttpServlet {
    @EJB
    private Cinema cinemaService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve movie ID from request
            int movieId = Integer.parseInt(request.getParameter("movieId"));

            // Fetch the movie details
            Film film = cinemaService.findFilm(movieId);
            if (film == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Movie not found");
                return;
            }

            // Fetch sessions for the movie
            List<Seance> Seances = cinemaService.getSessionsByMovie(movieId);

            // Set movie and sessions as request attributes
            request.setAttribute("movie", film);
            request.setAttribute("Sessions", Seances);

            // Forward to the JSP
            request.getRequestDispatcher("moviedetails.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid movie ID");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred");
        }
    }
}
