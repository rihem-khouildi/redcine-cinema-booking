package com.enit.entities;
import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;


@Entity
@Table( name= "COMPTES")
@NamedQueries({
@NamedQuery(name = "findAllComptes", query = "SELECT c FROM Compte c"),
@NamedQuery(name = "findCompteByName", query = "SELECT c FROM Compte c WHERE c.name = :cname"),
@NamedQuery(name = "findCompteById", query = "SELECT c FROM Compte c WHERE c.id =:cid") })

public class Compte implements Serializable {
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;//le nom du propri�taire du compte bancaire
    private String name; //Mot de passe du propri�taire du compte
    private String password;
    private double solde;
    
    public Compte() {
        super();
    }
    
    public Compte(String nom) {
        this.name=nom;
    }
    public Compte(Long id, String name, String password, double solde) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.solde = solde;
	}


	public Long getId() {
        return this.id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public double getSolde() {
        return this.solde;
    }
    
    public void setSolde(double solde) {
        this.solde = solde;
    }
    
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Compte[id=").append(getId()).append(", name=").append(getName()).append("]");
        return sb.toString();
    }
    
    public void setPassword(String password) {
	    this.password = password;
	}
    
	public String getPassword() {
	    return password;
	}
}
