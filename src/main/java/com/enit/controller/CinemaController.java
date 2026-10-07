package com.enit.controller;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import com.enit.entities.Film;
import com.enit.service.Cinema;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cinema")
public class CinemaController extends HttpServlet {
    @EJB
    private Cinema cinemaService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "listMovies";
        }

        switch (action) {
            case "listMovies":
                List<Film> films = cinemaService.getAllMovies();
                request.setAttribute("movies", films);
                request.getRequestDispatcher("/movieslist.jsp").forward(request, response);
                break;
            case "findMovie":
                String pattern = request.getParameter("pattern");
                Set<Film> filteredMovies = cinemaService.findByPattern(pattern);
                request.setAttribute("movies", filteredMovies);
                request.getRequestDispatcher("/movieslist.jsp").forward(request, response);
                break;
            // Ajouter d'autres actions (r�server, voir une s�ance, etc.)
        }
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Actions POST pour r�server, cr�er des films, etc.
    }
}

