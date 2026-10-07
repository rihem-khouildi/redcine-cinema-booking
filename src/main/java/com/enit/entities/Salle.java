package com.enit.entities;
import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="Salle")
public class Salle implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	private int id_salle;
	
	@Column(length = 30)
	private String nom;
	
	private int capacite ;
	
	public Salle() {
		super();
	}
	
	public Salle(int id_salle, String nom, int capacite) {
		this.id_salle = id_salle;
		this.nom = nom;
		this.capacite = capacite;
	}
	
	
	@OneToOne
	@JoinColumn(name="ID_SALLE")
	public int getId_salle() {
		return id_salle;
	}
	public void setId_salle(int id_salle) {
		this.id_salle = id_salle;
	}
	
	@Column (name="NOM_Salle")
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	

	public int getCapacite() {
		return capacite;
	}
	public void setCapacite(int capacite) {
		this.capacite = capacite;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id_salle;
		result = prime * result + ((nom == null) ? 0 : nom.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Salle other = (Salle) obj;
		if (capacite != other.capacite)
			return false;
		if (id_salle != other.id_salle)
			return false;
		if (nom == null) {
			if (other.nom != null)
				return false;
		} else if (!nom.equals(other.nom))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Salle [id_salle=" + id_salle + ", nom=" + nom + ", capacite=" + capacite + "]";
	}
	

	
	

}

