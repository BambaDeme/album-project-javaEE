package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Users;

import jdbc.Database;

public class UserDao {
	
	public static int lastId = 0;
	//private static ArrayList<Users> users = new ArrayList<Users>();
	
	// ajout d'un utilisateur
	public static void ajouter(Users u) {
		Connection conn = Database.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement("insert into users values (?,?,?,?,?,?)");
			
			ps.setInt(1, u.getId());
			ps.setString(2, u.getFirstName());
			ps.setString(3,u.getLastName());
			ps.setString(4,u.getLogin());
			ps.setString(5,u.getPassWord());
			ps.setString(5,u.getRole());
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// la liste des utilisateur
	public static ArrayList<Users> getAll() {
		
		ArrayList<Users> users = new ArrayList<Users>();
		Connection conn = Database.getConnection();
		
		try {
			PreparedStatement ps = conn.prepareStatement("select * from users");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Users u = new Users();
				
				u.setId(rs.getInt("id"));
				u.setFirstName(rs.getString("firstName"));
				u.setLastName(rs.getString("lastName"));
				u.setLogin(rs.getString("login"));
				u.setPassWord(rs.getString("passWord"));
				u.setRole(rs.getString("role"));
				users.add(u);
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	  return  users;
	  
		
	}
	
}
