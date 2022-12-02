package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane.MaximizeAction;

import model.bo.*;
import model.bean.*;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddProductServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductBO bo = new ProductBO();
		ArrayList<Integer> Id = bo.getId();
		List<Integer> listId = Id.stream()
				 .sorted()
				 .collect(Collectors.toList());
		String name=  request.getParameter("nameProduct");
		String category=  request.getParameter("category");
		String size=request.getParameter("size");
		String prices=  request.getParameter("prices");
		String image=  request.getParameter("image");
		int id = listId.get(listId.size()-1)+1;
		bo.Insert(String.valueOf(id), name, category, Integer.parseInt(size), Integer.parseInt(prices), image);
		response.sendRedirect("LoadDataManagerServlet");

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
