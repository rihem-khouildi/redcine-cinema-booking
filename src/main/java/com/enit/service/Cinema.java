package com.enit.service;

import java.util.List;
import java.util.Set;
import jakarta.ejb.Remote;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import com.enit.entities.Film;
import com.enit.entities.Salle;
import com.enit.entities.SalleProg;
import com.enit.entities.Seance;


@Remote
public interface Cinema {
	
    // Lister l'ensemble de films disponible au cinema.
     
    // Trouver les films correspondants au pattern donn� en entr�e.
    public Set<Film> findByPattern (String pattern);
     
    // Trouver un film � partir d'un id.
    public Film findFilm (int id);
    public List<Seance> getSessionsByMovie(int movieId);
    
    public Seance findSession(int sessionId);
    public boolean bookSeats(int sessionId, int numberOfSeats);
    public Salle getRoomById(int roomId) ;
   
    // R�server une s�ance pour un utilisateur.
   // public void reserve (Session seance, User u)throws PlusDePlaceException, SoldeNegatifException, UserNotFoundException, SoldeNegatifException, SoldeInsuffisantException;
    
    public List<SalleProg> getAllSalleProg ();
    public Film createFilm (String name ,String description);
    public void update (Film f);
    public float getTarif(int sessionId) ;
    List<Film> getAllMovies();
    public List<Film> searchMoviesByName(String name);
    
}
