package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Albums;

import dao.AlbumDao;
import dao.ImageDao;

/**
 * Servlet implementation class AfficherAlbum
 */
@WebServlet("/albums")
public class AfficherAlbum extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AfficherAlbum() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if( id != null && id.matches("[0-9]+")) {
			Albums album = AlbumDao.getAlbum(Integer.parseInt(id));
			if(album != null) {
				//System.out.println("visibility: "+album.getVisibility());
				if(album.getVisibility().equals("private") && request.getSession().getAttribute("user")==null ) {
					response.sendRedirect(request.getContextPath());
				}else {
					request.setAttribute("album", album);
					System.out.println("images: "+ImageDao.getImages(album.getId()));
					request.setAttribute("images",ImageDao.getImages(album.getId()));
					getServletContext().getRequestDispatcher("/WEB-INF/album-detail.jsp").forward(request, response);
				}			
			}
			else {
				response.sendRedirect(request.getContextPath());
			}
		}else {
			response.sendRedirect(request.getContextPath());
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
