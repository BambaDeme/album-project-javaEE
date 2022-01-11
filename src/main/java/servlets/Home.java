package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Albums;
import dao.AlbumDao;
import dao.UserDao;

/**
 * Servlet implementation class Home
 */
@WebServlet({"","/Home"})
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Home() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session =request.getSession();
    	Object form = session.getAttribute("form");
    	
    	boolean status = false;
    	
    	if( form != null) {
    		session.removeAttribute("form");
    		status = true;
    	}
  
    	// si l'utilisateur n'est pass connecté on recupére les albums publics
    	
    	if(session.getAttribute("user") == null) {
    		request.setAttribute("publicAlbums", AlbumDao.getPublicAlbums());
    		//System.out.println("Liste albums public: "+request.getAttribute("publicAlbums"));
    		/*ArrayList<Albums> publicAlbums = new ArrayList<Albums>();
    		publicAlbums = (ArrayList<Albums>) request.getAttribute("publicAlbums");
    		for(Albums album: publicAlbums) {
    			System.out.println(album.getCover());
    		}*/
    	}else {
    		request.setAttribute("publicAlbums", AlbumDao.getPublicAlbums());
    	}
		//request.setAttribute("users",UserDao.getAll()); 
		//System.out.println("liste: "+request.getAttribute("users"));
		getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
