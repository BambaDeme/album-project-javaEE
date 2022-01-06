package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Images;
import jdbc.Database;
public class ImageDao {
	
	public static int lastId = 0;
	
	// la liste des images d'un album
	public static ArrayList<Images> getImages(int id){
		
		Connection conn = Database.getConnection();
		ArrayList<Images> images = new ArrayList<Images>();
		
		try {
			PreparedStatement ps = conn.prepareStatement("select * from images where id_album = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				Images image = new Images();
				image.setId(rs.getInt("id"));
				image.setId_album(rs.getInt("id_album"));
				image.setTitre(rs.getString("titre"));
				image.setDescription(rs.getString("description"));
				image.setFichier(rs.getString("fichier"));
				image.setHauteur(rs.getDouble("hauteur"));
				image.setLargeur(rs.getDouble("largeur"));
				image.setDateCreation(rs.getString("dateCreation"));
				image.setDateMiseAjour(rs.getString("dateMiseAjour"));
				
				images.add(image);
			}
			if(images.size() == 0) {
				images = null;
			}
			ps.close();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return images;	
	}
	
}
