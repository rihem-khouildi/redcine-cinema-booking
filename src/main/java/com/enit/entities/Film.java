package com.enit.entities;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.*;

@Entity
@Table(name = "movies")
public class Film implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "idFilm")
    private int idFilm;

    @Column(name = "nomFILM", length = 30, nullable = false)
    private String nomFILM;

    @Column(name = "genre", length = 50)
    private String genre;

    @Column(name = "rating", precision = 2)
    private double rating;

    @Column(name = "description", length = 1000)
    private String description;

    @OneToMany(mappedBy = "film", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<SalleProg> SalleProg;
    

    // Default constructor
    public Film() {
    }

    // Constructor with 'nom'
    public Film(String nom) {
        this.nomFILM = nom;
    }

    // Constructor with 'id_film' and 'nom'
    public Film(int id_film, String nom) {
        this.idFilm= id_film;
        this.nomFILM = nom;
    }

    // Constructor with all attributes
    public Film(int id_film, String nom, String genre, double rating, String description) {
        this.idFilm = id_film;
        this.nomFILM= nom;
        this.genre = genre;
        this.rating = rating;
        this.description = description;
    }

    // Getters and Setters
    public int getId_film() {
        return idFilm;
    }

    public void setId_film(int id_film) {
        this.idFilm = id_film;
    }

    public String getNom() {
        return nomFILM;
    }

    public void setNom(String nom) {
        this.nomFILM = nom;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<SalleProg> getSalleProg() {
        return SalleProg;
    }

    public void setSalleProg(List<SalleProg> SalleProg) {
        this.SalleProg = SalleProg;
    }
    @Override
    public String toString() {
        return "Movie{id=" + idFilm + ", name='" + nomFILM + "', genre='" + genre + "', description='" + description + "', rating=" + rating + "}";
    }
}
