package com.enit.service;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;

import com.enit.entities.Film;
import com.enit.entities.SalleProg;
import com.enit.entities.Seance;
import com.enit.entities.Salle;

@Stateless
public class CinemaBean implements Cinema {

    @PersistenceContext(unitName = "CinemaExam_UP")
    private EntityManager em;

    public CinemaBean() {
        super();
    }

    @Override
    public Set<Film> findByPattern(String pattern) {
        Query q = em.createNamedQuery("findFilmByPattern");
        q.setParameter("nom", "%" + pattern + "%");
        List<Film> res = (List<Film>) q.getResultList();
        return res.stream().collect(Collectors.toSet());
    }

    @Override
    public Film findFilm(int id) {
        return em.find(Film.class, id);
    }

    @Override
    public Film createFilm(String name, String description) {
        Film film = new Film();
        film.setNom(name);
        film.setDescription(description);
        em.persist(film);
        return film;
    }

    @Override
    public void update(Film film) {
        em.merge(film);
    }

    @Override
    public Seance findSession(int sessionId) {
        return em.find(Seance.class, sessionId);
    }
    public boolean bookSeats(int sessionId, int numberOfSeats) {
        Seance seance = findSession(sessionId);
        if (seance == null || seance.getPlaces() < numberOfSeats) {
            return false; // Booking not possible
        }

        // Decrease available seats
        seance.setPlaces(seance.getPlaces() - numberOfSeats);
        em.merge(seance); // Persist the updated session
        return true; // Booking successful
    }
    @Override
    public List<Seance> getSessionsByMovie(int movieId) {
        return em.createQuery(
                "SELECT s FROM Seance s WHERE s.salleProg.film.idFilm = :movieId",
                Seance.class
            )
            .setParameter("movieId", movieId)
            .getResultList();
    }


    @Override
    public List<Film> getAllMovies() {
        return em.createQuery("SELECT m FROM Film m", Film.class).getResultList();
    }

    @Override
    public Salle getRoomById(int roomId) {
        return em.find(Salle.class, roomId);
    }
    @Override
    public List<SalleProg> getAllSalleProg() {
        return em.createQuery("SELECT rp FROM SalleProg rp", SalleProg.class).getResultList();
    }


    @Override
    public float getTarif(int sessionId) {
        // Trouver la session avec l'ID spécifié
        Seance seance = findSession(sessionId);
        if (seance == null) {
            throw new IllegalArgumentException("Session not found for ID: " + sessionId);
        }
        // Retourner le tarif de la session trouvée
        return seance.getTarif();
    }
    @Override
    public List<Film> searchMoviesByName(String name) {
        return em.createQuery("SELECT m FROM Film m WHERE m.nomFILM LIKE :name", Film.class)
                            .setParameter("name", "%" + name + "%")
                            .getResultList();
    }

   

}
    

    
    

