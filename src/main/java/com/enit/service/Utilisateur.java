package com.enit.service;


import com.enit.entities.Compte;
import com.enit.service.SoldeNegatifException;
import com.enit.service.UserNotFoundException;

import jakarta.ejb.Remote;

@Remote
public interface Utilisateur {
     //Initialiser le bean compte bancaire utilisateur (authentification) 
     public void init(String name, String passwd) throws UserNotFoundException; 
     
     public String getName() throws UserNotFoundException; 
     
     public float solde() throws SoldeNegatifException,UserNotFoundException; 
     
     // D�biter le compte de l'utilisateur
     public void debite(float f) throws SoldeNegatifException,UserNotFoundException;
     public void createAccount(String name, String password) throws Exception ;
     public Compte findAccountByUserId(String userId);
     public boolean processPayment(String userId, double amount);
     public Long getUserId(String username) throws UserNotFoundException;
}

