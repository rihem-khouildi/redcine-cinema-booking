package com.enit.service;

import com.enit.entities.Film;

import jakarta.ejb.Remote;

import java.util.List;


@Remote
public interface FilmService {
    List<Film> getAllMovies();
   
}
