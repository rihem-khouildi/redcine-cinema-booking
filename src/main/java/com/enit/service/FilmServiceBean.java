package com.enit.service;

import com.enit.entities.Film;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

import jakarta.ejb.Stateless;
import java.util.ArrayList;
import java.util.List;

@Stateless
public class FilmServiceBean implements FilmService {
	@PersistenceContext(unitName="CinemaExam_UP")
    private EntityManager em = null;
    public FilmServiceBean() {
    	super();
    }

    @Override
    public List<Film> getAllMovies() {
        Query req = em.createQuery("select c from Compte c");
        return (List<Film>) req.getResultList();
    }

    
}
