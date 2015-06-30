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

@WebServlet("/addPerson")
public class AddPersonServlet extends HttpServlet {

	private static final long serialVersionUID = -7060758261496829905L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		String phone = request.getParameter("phone");
		if ((name == null || name.equals(""))
				|| (surname == null || surname.equals(""))) {
			request.setAttribute("error", "Boş alanları doldurunuz...");
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/addpersons.jsp");
			rd.forward(request, response);
		} else {
			Person p = new Person();
			p.setPhone(phone);
			p.setSurname(surname);
			p.setName(name);
			MongoClient mongo = (MongoClient) request.getServletContext()
					.getAttribute("MONGO_CLIENT");
			MongoDBPersonDAO personDAO = new MongoDBPersonDAO(mongo);
			personDAO.createPerson(p);
			System.out.println("Kullanıcı eklendi. id="+p.getId());
			request.setAttribute("success", "Kullanıcı eklendi");
			List<Person> persons = personDAO.readAllPerson();
			request.setAttribute("persons", persons);

			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/addpersons.jsp");
			rd.forward(request, response);
		}
	}

}
