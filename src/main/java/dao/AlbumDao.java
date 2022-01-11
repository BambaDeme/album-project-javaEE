package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Albums;

import jdbc.Database;
public class AlbumDao {
	
	public static int lastId = 0;
	
	public static void ajouter(Albums album) {
		Connection conn = Database.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement("insert into albuums values (?,?,?)");
			ps.setString(1, album.getTheme());
			ps.setString(2, album.getVisibility());
			ps.setInt(3, album.getId_proprietaire());
			ps.executeUpdate();
			ps.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	// la liste des albuums pblics: visible par tout le monde
	public static ArrayList<Albums> getPublicAlbums(){
		Connection conn = Database.getConnection();
		
		ArrayList<Albums> publicAlbums = new ArrayList<Albums>();
		try {
			PreparedStatement ps = conn.prepareStatement("select * from albums where visibility = ?");
			ps.setString(1, "public");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Albums album = new Albums();
				album.setId(rs.getInt("id"));
				album.setTheme(rs.getString("theme"));
				album.setVisibility(rs.getString("visibility"));
				album.setId_proprietaire(rs.getInt("id_proprietaire"));
				album.setCover(rs.getString("cover"));
				
				publicAlbums.add(album);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return publicAlbums;
	}
	
	// la liste des albums autiris�s pour un utilisateur donn�
	public static ArrayList<Albums> getAuthorizedAlbums(int userId){
		Connection conn = Database.getConnection();
		ArrayList<Albums> authorizedAlbums = new ArrayList<Albums>();
		
		try {
			PreparedStatement ps = conn.prepareStatement("select * from autorisation where user_id = ?");
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int albumId = rs.getInt("album_id");
				//System.out.println("id album: "+albumId);
				authorizedAlbums.add(AlbumDao.getAlbum(albumId));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return authorizedAlbums;
		
	}
	
	// la liste des albums de l'utilisateur
	public static ArrayList<Albums> getUserAlbums(int userId){
		Connection conn = Database.getConnection();
		
		ArrayList<Albums> userAlbums = new ArrayList<Albums>();
		
		try {
			PreparedStatement ps = conn.prepareStatement("select * from albums where id_proprietaire = ?");
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int albumId = rs.getInt("id");
				//System.out.println("id album: "+albumId);
				userAlbums.add(AlbumDao.getAlbum(albumId));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		return userAlbums;
	}
	

	public static Albums getAlbum(int id) {
		Albums album = new Albums();
		Connection conn = Database.getConnection();
		
		try {
			PreparedStatement ps = conn.prepareStatement("select * from albums where id = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				album.setId(rs.getInt("id"));
				album.setTheme(rs.getString("theme"));
				album.setVisibility(rs.getString("visibility"));
				album.setId_proprietaire(rs.getInt("id_proprietaire"));
				album.setCover(rs.getString("cover"));
			}else {
				album = null;
			}
			ps.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return album;
	}
}
