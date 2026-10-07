package com.enit.entities;

import java.io.Serializable;
import java.util.Date;

import jakarta.persistence.*;

@Entity
@Table(name = "Session")
public class Seance implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "idSeance")
    private int id_seance;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "horaire", nullable = false)
    private Date horaire;

    @Column(name = "places", nullable = false)
    private int places;

    @Column(name = "tarif", precision = 2, nullable = false)
    private float tarif;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_salleprog", nullable = false)
    private SalleProg salleProg;

    // Default constructor
    public Seance() {
    }

    // Constructor with all fields
    public Seance(int id_seance, Date horaire, int places, float tarif) {
        this.id_seance = id_seance;
        this.horaire = horaire;
        this.places = places;
        this.tarif = tarif;
    }

    // Getters and Setters
    public int getId_seance() {
        return id_seance;
    }

    public void setId_seance(int id_seance) {
        this.id_seance = id_seance;
    }

    public Date getHoraire() {
        return horaire;
    }

    public void setHoraire(Date horaire) {
        this.horaire = horaire;
    }

    public int getPlaces() {
        return places;
    }

    public void setPlaces(int places) {
        this.places = places;
    }

    public float getTarif() {
        return tarif;
    }

    public void setTarif(float tarif) {
        this.tarif = tarif;
    }

    public SalleProg getSalleProg() {
        return salleProg;
    }

    public void setSalleProg(SalleProg salleProg) {
        this.salleProg = salleProg;
    }
}
