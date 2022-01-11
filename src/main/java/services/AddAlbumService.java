package services;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import beans.Albums;
import beans.Users;

public class AddAlbumService {
	private static final String THEME = "theme";
	private static final String VISIBILITY = "visibility";
	private static final String COVER = "cover";
	
	private boolean status ;
	
	private Albums album;
	private HttpServletRequest request;
	private Map<String, String> erreurs;
	
	public AddAlbumService(HttpServletRequest request) {
		this.status = false;
		this.request = request;
		this.erreurs = new HashMap<>();
	}
	
	public boolean ajouter() throws SQLException {
		String theme = getParameter(THEME);
		String visibility = getParameter(VISIBILITY);
		String cover = getParameter(COVER);
		
		System.out.println("theme:"+theme);
		System.out.println("visibilité:"+visibility);
		System.out.println("cover:"+cover);
		
		Users connecteduser = (Users) request.getSession().getAttribute("users");
		int idProprietaire = connecteduser.getId();
		album = new Albums(idProprietaire,theme,visibility,cover);
		System.out.println("album:"+album);
		
		validerChamps(THEME,VISIBILITY,COVER);
		
		if(erreurs.isEmpty()) {
			return true;
		}
		
		return false;
	}
	
	private String getParameter(String parametre) {
		
		String valeur = request.getParameter(parametre);
		System.out.println("valeur: "+valeur);
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
}

