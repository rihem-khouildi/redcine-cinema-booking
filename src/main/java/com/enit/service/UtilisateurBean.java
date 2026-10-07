package com.enit.service;

import java.util.List;

import jakarta.ejb.Stateful;
import jakarta.ejb.TransactionAttribute;
import jakarta.ejb.TransactionAttributeType;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

import com.enit.entities.Compte;



@Stateful
public class UtilisateurBean implements Utilisateur {
	@PersistenceContext(unitName="CinemaExam_UP")
    private EntityManager em = null;
    private Long user_id;
    
    public UtilisateurBean() {
        super();
    }
    
@TransactionAttribute(TransactionAttributeType.REQUIRED)
public void debite(float somme) throws SoldeNegatifException,UserNotFoundException{
    float solde;
    solde = solde();
    if( solde+somme <= 0 ){
         throw new SoldeNegatifException();
    }else{
         Compte compte;
         Query q = em.createNamedQuery("findCompteById");
         q.setParameter("cid",user_id);
		List<Compte> res = (List<Compte>)(q.getResultList());
         if(res.size()==0){
	         throw new UserNotFoundException();
        }else{
	          compte = res.get(0);
	          compte.setSolde(solde+somme);
	          em.merge(compte);
	    }
	} 
}

	public String getName() throws UserNotFoundException{
	     String nom;
	     Query q = em.createNamedQuery("findCompteById");
	     q.setParameter("cid",user_id);
	     List<Compte> res = (List<Compte>)(q.getResultList());
	     if(res.size()==0){
            	throw new UserNotFoundException();
	     }else{
	            nom = res.get(0).getName();
	     }
	      return nom;
	}
	
	
	public void init(String name, String passwd) throws UserNotFoundException {
	    Query q = em.createNamedQuery("findCompteByName");
	    q.setParameter("cname",name);
	    @SuppressWarnings("unchecked")
		List<Compte> res = (List<Compte>)q.getResultList();
	    if (res==null || res.size()==0) {
	        throw new UserNotFoundException();
	    }else{
	        if (res.get(0).getName().equals(name) && res.get(0).getPassword().equals(passwd)){
	            user_id = (long) res.get(0).getId();
	        }else {
	            throw new UserNotFoundException();
	        }
	}
	}
	
	
	
	public float solde() throws UserNotFoundException{
	    float sld;
	    Query q = em.createNamedQuery("findCompteById");
	    q.setParameter("cid",user_id);
	    List<Compte> res = (List<Compte>)(q.getResultList());
	    if(res.size()==0)
	        throw new UserNotFoundException();
	    else
        	sld = (float) res.get(0).getSolde();
    	return sld;
	}
	
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
    public void createAccount(String name, String password) throws Exception {
        // Check if the username already exists
        Query q = em.createNamedQuery("findCompteByName");
        q.setParameter("cname", name);
        List<Compte> res = (List<Compte>) q.getResultList();
        
        if (res != null && res.size() > 0) {
            // Username already exists
            throw new Exception("Username already exists.");
        }
        
        // Create a new Account object
        Compte newAccount = new Compte();
        newAccount.setName(name);
        newAccount.setPassword(password);  // Ideally, hash the password before storing it
        
        // Set an initial balance (0 or whatever the default is)
        newAccount.setSolde(0);

        // Persist the new account to the database
        em.persist(newAccount);
    }
	
	
	
	
	public Compte findAccountByUserId(String userId) {
	    try {
	    	System.out.println("Searching for Compte with userId: " + userId);
	        Long userLongId = Long.parseLong(userId);  // Convert String to Long
	        return em.createQuery(
	            "SELECT a FROM Compte a WHERE a.id = :userId", Compte.class)
	            .setParameter("userId", userLongId)
	            .getSingleResult();
	    } catch (Exception e) {
	        // Log the exception and return null if no account is found
	        System.out.println("Error finding account for userId: " + userId);
	        return null;
	    }
	}



	 // Process payment by deducting the amount from user's solde
	public boolean processPayment(String userId, double totalPrice) {
	    Compte compte = findAccountByUserId(userId);  // Retrieve account by userId
	    if (compte == null) {
	        System.out.println("Account not found for user: " + userId);
	        return false;
	    }
	    double balance = compte.getSolde();
	    System.out.println("Current balance: " + balance);
	    if (balance < totalPrice) {
	        System.out.println("Insufficient balance: " + balance + " < " + totalPrice);
	        return false;  // Insufficient balance
	    }
	    compte.setSolde(balance - totalPrice);  // Deduct the price  // Persist changes
	    System.out.println("Payment processed. New balance: " + compte.getSolde());
	    return true;  // Payment successful
	}

    
    
    
    
    public Long getUserId(String username) throws UserNotFoundException {
        // Create the query to find the account by username
        TypedQuery<Compte> query = em.createNamedQuery("findCompteByName", Compte.class);
        query.setParameter("cname", username);
        
        // Attempt to get the result (single Account object)
        try {
            Compte compte = query.getSingleResult(); // Throws NoResultException if not found
            return (Long) compte.getId(); // Return the user ID
        } catch (jakarta.persistence.NoResultException e) {
            throw new UserNotFoundException("User not found: " + username);
        }
    }
}
	
