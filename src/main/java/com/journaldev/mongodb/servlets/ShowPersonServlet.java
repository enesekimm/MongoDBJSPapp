package com.journaldev.mongodb.servlets;

	import java.io.IOException;
	import java.util.List;

	import javax.servlet.RequestDispatcher;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;

	import com.journaldev.mongodb.dao.MongoDBPersonDAO;
	import com.journaldev.mongodb.model.Person;
	import com.mongodb.MongoClient;

	@WebServlet("/showPerson")
	public class ShowPersonServlet extends HttpServlet {

		private static final long serialVersionUID = -7560758261496829905L;

		protected void doPost(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			
				MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGO_CLIENT");
				MongoDBPersonDAO personDAO = new MongoDBPersonDAO(mongo);
				
				List<Person> persons = personDAO.readAllPerson();
				request.setAttribute("persons", persons);

				RequestDispatcher rd = getServletContext().getRequestDispatcher("/persons.jsp");
				rd.forward(request, response);
			}
		}

