package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import services.AddUserService;


/**
 * Servlet implementation class AddUser
 */
@WebServlet({"/add","/users/add"})
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
    	Object form = session.getAttribute("form");
    	
    	if( form != null) {
    		session.removeAttribute("form");
    	}
    	
    	request.setAttribute("form", form);
		getServletContext().getRequestDispatcher("/WEB-INF/ajoutUtilisateur.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AddUserService form = new AddUserService(request);
		//System.out.println(form);
		HttpSession session = request.getSession();
		session.setAttribute("form", form);
		
		try {
			if(form.ajouter()) {
				form.setStatusMessage("success");
				/*String url = request.getContextPath() +"/accueil" + "?message="+ form.getStatusMessage();
				response.sendRedirect(url);*/
				getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
			}
			else {
				
				form.setStatusMessage("fail");
				//response.sendRedirect(request.getContextPath() +"/users/add");
				getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
