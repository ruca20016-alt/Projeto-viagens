package controller;

import java.io.IOException;
import java.time.LocalDate;
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
	@Resource(name = "agenciadeviagens")
	private DataSource dataSource;

	@Override
	public void init() throws ServletException {
		vDAO = new ViagemDAO(dataSource);
	}

	public ViagemController() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    String operacao = request.getParameter("operacao");
	    operacao = operacao.toLowerCase();

	    switch (operacao) {
	        case "listar":
	            listarViagens(request, response);
	            break;

	        case "remover":
	            confirmarRemocao(request, response);
	            break;

	        case "editar":
	            abrirFormularioEdicao(request, response);
	            break;
	            
	        case "calcular":
	            calcularViagem(request, response);
	            break;

	        default:
	            System.out.println("Erro! Operação não encontrada.");
	    }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    String operacao = request.getParameter("operacao");
	    operacao = operacao.toLowerCase();

	    switch (operacao) {
	        case "cadastrar":
	            inserirViagem(request, response);
	            break;

	        case "remover":
	            removerViagem(request, response);
	            break;

	        case "atualizar":
	            atualizarViagem(request, response);
	            break;

	        default:
	            System.out.println("Erro! Operação não encontrada.");
	    }
	}

	private void listarViagens(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<Viagem> listaViagens = vDAO.consultarViagens();

		request.setAttribute("agenciadeviagens", listaViagens);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/catalogoViagens.jsp");
		dispatcher.forward(request, response);
	}

	private void inserirViagem(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String destino = request.getParameter("destino");
		String pais = request.getParameter("pais");
		int duracao = Integer.parseInt(request.getParameter("duracao"));
		double vDiaria = Double.parseDouble(request.getParameter("vDiaria"));
		LocalDate dtViagem = LocalDate.parse(request.getParameter("dtViagem"));
		String meioTrans = request.getParameter("meioTrans");
		double valorPassagem = Double.parseDouble(request.getParameter("valorPassagem"));
		int nPessoas = Integer.parseInt(request.getParameter("nPessoas"));

		boolean resultado = vDAO.inserirViagem(destino, pais, duracao, vDiaria, dtViagem, meioTrans, valorPassagem,
				nPessoas);

		request.setAttribute("mensagem", resultado ? "Viagem cadastrada com sucesso!" : "Erro ao cadastrar viagem!");
		request.setAttribute("tipoMensagem", resultado ? "sucesso" : "erro");
		listarViagens(request, response);
	}

	private void confirmarRemocao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		Viagem viagem = vDAO.buscarViagemPorId(id);

		request.setAttribute("viagem", viagem);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/confirmarRemocao.jsp");
		dispatcher.forward(request, response);
	}

	private void removerViagem(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		boolean resultado = vDAO.removerViagem(id);

		request.setAttribute("mensagem", resultado ? "Viagem removida com sucesso!" : "Erro ao remover viagem!");
		request.setAttribute("tipoMensagem", resultado ? "sucesso" : "erro");

		listarViagens(request, response);
	}

	private void atualizarViagem(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		String destino = request.getParameter("destino");
		String pais = request.getParameter("pais");
		int duracao = Integer.parseInt(request.getParameter("duracao"));
		double vDiaria = Double.parseDouble(request.getParameter("vDiaria"));
		LocalDate dtViagem = LocalDate.parse(request.getParameter("dtViagem"));
		String meioTrans = request.getParameter("meioTrans");
		double valorPassagem = Double.parseDouble(request.getParameter("valorPassagem"));
		int nPessoas = Integer.parseInt(request.getParameter("nPessoas"));

		boolean resultado = vDAO.atualizarViagem(id, destino, pais, duracao, vDiaria, dtViagem, meioTrans,
				valorPassagem, nPessoas);

		request.setAttribute("mensagem", resultado ? "Viagem atualizada com sucesso!" : "Erro ao atualizar viagem!");
		request.setAttribute("tipoMensagem", resultado ? "sucesso" : "erro");

		listarViagens(request, response);
	}
	
	private void abrirFormularioEdicao(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    int id = Integer.parseInt(request.getParameter("id"));

	    Viagem viagem = vDAO.buscarViagemPorId(id);

	    request.setAttribute("viagem", viagem);

	    RequestDispatcher dispatcher = request.getRequestDispatcher("/FormViagem.jsp");
	    dispatcher.forward(request, response);
	}
	
	private void calcularViagem(
	        HttpServletRequest request,
	        HttpServletResponse response)
	        throws ServletException, IOException {

	    int id = Integer.parseInt(request.getParameter("id"));
	    String tipo = request.getParameter("tipo");

	    Viagem viagem = vDAO.buscarViagemPorId(id);

	    if (viagem == null) {
	        request.setAttribute("mensagem", "Viagem não encontrada.");
	        request.setAttribute("tipoMensagem", "erro");

	        listarViagens(request, response);
	        return;
	    }

	    String tituloResultado;
	    String resultadoCalculo;

	    switch (tipo) {
	        case "total":
	            tituloResultado = "Custo total";
	            resultadoCalculo = String.format(
	                    "R$ %.2f",
	                    viagem.calcularCustoTotal()
	            );
	            break;

	        case "pessoa":
	            tituloResultado = "Custo por pessoa";
	            resultadoCalculo = String.format(
	                    "R$ %.2f",
	                    viagem.calcularCustoPorPessoa()
	            );
	            break;

	        case "dataFinal":
	            tituloResultado = "Data final da viagem";
	            resultadoCalculo = viagem
	                    .calcularDataFinalViagem()
	                    .toString();
	            break;

	        default:
	            request.setAttribute("mensagem", "Tipo de cálculo inválido.");
	            request.setAttribute("tipoMensagem", "erro");

	            listarViagens(request, response);
	            return;
	    }

	    request.setAttribute("tituloResultado", tituloResultado);
	    request.setAttribute("resultadoCalculo", resultadoCalculo);
	    request.setAttribute("viagemCalculada", viagem);

	    listarViagens(request, response);
	}

}
