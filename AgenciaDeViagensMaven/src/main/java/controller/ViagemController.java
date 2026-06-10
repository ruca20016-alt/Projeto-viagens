package controller;

import java.io.IOException;

import javax.sql.DataSource;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.TarefaDAO;
import model.ViagemDAO;


@WebServlet("/ViagemController")
public class ViagemController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ViagemDAO vDAO;
	@Resource(name="bancoTarefas")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		vDAO = new ViagemDAO(dataSource);
	}
	
    public ViagemController() {
  
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
