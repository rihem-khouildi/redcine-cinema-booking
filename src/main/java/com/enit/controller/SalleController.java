package com.enit.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import com.enit.entities.Salle;
import com.enit.entities.SalleProg;
import com.enit.service.Cinema;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/room")
public class SalleController extends HttpServlet {
    @EJB
    private Cinema cinemaService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // R�cup�rer toutes les programmations de salle
        List<SalleProg> salleProgs = cinemaService.getAllSalleProg();

        // Si vous voulez aussi r�cup�rer les informations des salles associ�es (Room) � chaque RoomProg
        Set<Salle> salles = salleProgs.stream()
            .map(roomProg -> roomProg.getSalle()) // supposons que RoomProg a une m�thode getSalle() pour acc�der � l'objet Room
            .collect(Collectors.toSet());

        // Ajouter la liste des salles � la requ�te
        request.setAttribute("rooms", salles);

        // Rediriger vers la JSP pour afficher les salles
        request.getRequestDispatcher("movieslist.jsp").forward(request, response);
    }

    // G�rer la cr�ation ou l'ajout d'une salle
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 try {
             // Get seat ID and room ID from the request
           
             int roomId = Integer.parseInt(request.getParameter("roomId"));

             // Book the seat by changing its status
            

             // Redirect to the updated page
             response.sendRedirect("movieslist.jsp?roomId=" + roomId);
         } catch (Exception e) {
             e.printStackTrace();
             response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error booking seat.");
         }
    }

}
