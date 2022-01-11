package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Users;
import dao.AlbumDao;

/**
 * Servlet implementation class UserAlbums
 */
@WebServlet("/UserAlbums")
public class UserAlbums extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAlbums() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
    	Object form = session.getAttribute("form");
    	
    	boolean status = false;
    	
    	if( form != null) {
    		session.removeAttribute("form");
    		status = true;
    	}
    	
    	if(session.getAttribute("user") == null) {
    		getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward(request,response);
    	}
    	else {
    		Users connectedUser = (Users) session.getAttribute("user");
    		request.setAttribute("userAlbums", AlbumDao.getUserAlbums(connectedUser.getId()));
    		//System.out.println("albums:"+request.getAttribute("userAlbums"));
    		getServletContext().getRequestDispatcher("/WEB-INF/userAlbums.jsp").forward(request,response);

    	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
