package services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import beans.Users;
import dao.UserDao;


public class LoginService {
	private HttpServletRequest request;
	private String login="";
	private static final String CHAMP_LOGIN="username";
	private static final String CHAMP_PASSWORD="password";
	
	public LoginService(HttpServletRequest request) {
		this.request=request;	
	}
	
	public boolean authentifier() {
		login=request.getParameter(CHAMP_LOGIN);
		String password=request.getParameter(CHAMP_PASSWORD);
		
		
		
		Users user = null;
		HttpSession session=request.getSession();
		if ("admin".equals(login) && "passer".equals(password)) 		
		{
			user=new Users();
			session.setAttribute("user", user);
			
		}
		else 
		{
			user = UserDao.getUserByLogin(login);
			
			if ( user!=null && !user.getPassWord().equals(password))
			{
				user=null;
			}
		}
		if (user!=null) {
			session.setAttribute("user", user);
			return true;
		}
		
		return false;
	}
	
	public String getLogin() {
		return this.login;
	
	}
}
