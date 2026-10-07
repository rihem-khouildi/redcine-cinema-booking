package com.enit.controller;

import java.io.IOException;
import java.util.List;

import com.enit.entities.Film;
import com.enit.service.Cinema;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/movie")
public class FilmController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @EJB
    private Cinema cinemaService;

    // Handle GET requests
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    	 // Log cinemaBean injection
        System.out.println("Cinema Bean: " + (cinemaService != null ? "Injected successfully" : "Not injected"));

        // Récupérer le paramètre de recherche (si présent)
        String search = request.getParameter("search");

        List<Film> films;

        // Si un terme de recherche est fourni, appeler une méthode pour filtrer les films
        if (search != null && !search.trim().isEmpty()) {
            System.out.println("Recherche activée : " + search);
            films = cinemaService.searchMoviesByName(search);
        } else {
            // Sinon, récupérer tous les films
            System.out.println("Aucune recherche, affichage de tous les films");
            films = cinemaService.getAllMovies();
        }

        // Ajouter la liste des films à la requête
        System.out.println("Films récupérés : " + films);
        request.setAttribute("movies", films);

        // Rediriger vers la JSP
        request.getRequestDispatcher("/movieslist.jsp").forward(request, response);
    }
    
 //
    
    
    
    
    
    // Handle POST requests
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            response.sendRedirect("/movie?action=list");
            return;
        }

        switch (action) {
            case "add":
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                try {
                    cinemaService.createFilm(title, description);
                    response.sendRedirect("/movie?action=list");
                } catch (Exception e) {
                    request.setAttribute("error", "Failed to add movie: " + e.getMessage());
                    request.getRequestDispatcher("/AddMovie.jsp").forward(request, response);
                }
                break;

            default:
                response.sendRedirect("/movie?action=list");
        }
    }
}
