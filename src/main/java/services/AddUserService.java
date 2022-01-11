package services;

import javax.servlet.http.HttpServletRequest;

import beans.Users;

import dao.UserDao;


//import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.SQLException;
//import java.sql.Statement;

import java.util.HashMap;
import java.util.Map;

public class AddUserService {
	private static final String CHAMP_NOM = "firstName";
	private static final String CHAMP_PRENOM = "lastName";
	private static final String CHAMP_LOGIN = "username";
	private static final String CHAMP_PASSWORD = "password";
	private static final String CHAMP_PASSWORD_BIS = "passwordConfirm";
	
	
	private boolean status ;
	private String statusMessage;
	private Users user;
	private HttpServletRequest request;
	private Map<String, String> erreurs;
	
	public AddUserService(HttpServletRequest request) {
		this.status = false;
		this.request = request;
		this.erreurs = new HashMap<>();
	}
	
	public boolean ajouter() throws SQLException {
		
		String nom = getParameter(CHAMP_NOM);
		String prenom = getParameter(CHAMP_PRENOM);
		String login = getParameter(CHAMP_LOGIN);
		String password = getParameter(CHAMP_PASSWORD);
		String role = "simple";
		
		user = new Users(prenom,nom,login,password,role);
		//System.out.println(user);
		//IUserMetier metier = new UserMetierImpl();
		
		validerChamps(CHAMP_NOM, CHAMP_PRENOM, CHAMP_LOGIN,CHAMP_PASSWORD,CHAMP_PASSWORD_BIS);
		validerPasswords();
		
		if(erreurs.isEmpty()) {
			UserDao.ajouter(user);
			return true;
		}
		return false;
	}
	
	private String getParameter(String parametre) {
		
		String valeur = request.getParameter(parametre);
		
		if(valeur == null || valeur.trim().isEmpty()) {
			return null;
		}
		return valeur.trim();
	}
	
	private void validerChamps(String ...champs) {
		
		for (String champ : champs) {
			if(getParameter(champ) == null) {
				
				erreurs.put(champ, "Vous devez renseigner ce champ");
			}
		}
	}
	
	private void validerPasswords() {
		
		String password = getParameter(CHAMP_PASSWORD);
		String passwordBis  = getParameter(CHAMP_PASSWORD_BIS);
		
		if(password != null && !password.equals(passwordBis)) {
			erreurs.put(CHAMP_PASSWORD,"Les mots de passe ne sont pas conformes");
			erreurs.put(CHAMP_PASSWORD_BIS,"Les mots de passe ne sont pas conformes");
		}
	}
	
	public boolean getStatus() {
		return status;
	}


	public String getStatusMessage() {
		return statusMessage;
	}
	public void setStatusMessage(String status) {
		this.statusMessage = status;
	}


	public Users getUser() {
		return user;
	}


	public Map<String, String> getErreurs() {
		return erreurs;
	}
	
}
