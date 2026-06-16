package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.sql.DataSource;

import VO.Viagem;
import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ViagemDAO;


@WebServlet("/ViagemController")
public class ViagemController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ViagemDAO vDAO;
	@Resource(name="agenciadeviagens")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		vDAO = new ViagemDAO(dataSource);
	}
	
    public ViagemController() {
  
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String operacao = request.getParameter("operacao");
		operacao = operacao.toLowerCase();
		
		switch(operacao) {
			case "listar":
				listarViagens(request, response);
				break;
//			case "cadastrar":
//				cadastrarTarefa(request, response);
//				break;
//			case "remover":
//				removerTarefa(request, response);
//				break;
			default:
				System.out.println("Erro! Operação não encontrada.");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
	}
	
	private void listarViagens(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Viagem> listaViagens = vDAO.consultarViagens();
		
		request.setAttribute("agenciadeviagens", listaViagens);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/catalogoViagens.jsp");
		dispatcher.forward(request, response);
	}

}
