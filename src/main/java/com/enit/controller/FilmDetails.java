package com.enit.controller;

import com.enit.entities.Film;
import com.enit.entities.Seance;
import com.enit.service.Cinema;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/movieDetails")
public class FilmDetails extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @EJB
    private Cinema cinemaService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get movie ID from query parameter
        String movieIdParam = request.getParameter("id");
        if (movieIdParam == null || movieIdParam.isEmpty()) {
            response.sendRedirect("movieslist.jsp");
            return;
        }

        try {
            int movieId = Integer.parseInt(movieIdParam);
            Film film = cinemaService.findFilm(movieId);

            if (film == null) {
                response.sendRedirect("movieslist.jsp");
                return;
            }
            List<Seance> seances = cinemaService.getSessionsByMovie(movieId);

            // Set movie as request attribute and forward to JSP
            request.setAttribute("movie", film);
            request.setAttribute("sessions", seances);
            request.getRequestDispatcher("/MovieDetails.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("movieslist.jsp");
        }
    }
}
