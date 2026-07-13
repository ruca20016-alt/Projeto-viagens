<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList,VO.Viagem,java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" />
<meta charset="UTF-8">
<title>Catálogo de viagens</title>
<link rel="stylesheet" href="style.css">
</head>

<body class="pagina-catalogo">

	<div class="container-catalogo">

		<div class="cabecalho-catalogo">
			<h1>Pacotes de Viagens</h1>

			<a href="FormViagem.jsp" class="botao-principal"> Nova Viagem </a>
		</div>
		
		<% 
		String mensagem = (String) request.getAttribute("mensagem");
		String tipoMensagem = (String) request.getAttribute("tipoMensagem");

		if (mensagem != null) {
		    String classeMensagem = "sucesso".equals(tipoMensagem)
		            ? "mensagem-sucesso"
		            : "mensagem-erro";
		%>

		    <p class="<%= classeMensagem %>"><%= mensagem %></p>

		<%
		}

		String tituloResultado =
		        (String) request.getAttribute("tituloResultado");

		String resultadoCalculo =
		        (String) request.getAttribute("resultadoCalculo");

		Viagem viagemCalculada =
		        (Viagem) request.getAttribute("viagemCalculada");

		if (tituloResultado != null
		        && resultadoCalculo != null
		        && viagemCalculada != null) {
		%>

		    <div class="resultado-calculo">

		        <div>
		            <h2><%= tituloResultado %></h2>

		            <p>
		                <strong>Viagem:</strong>
		                <%= viagemCalculada.getDestino() %>,
		                <%= viagemCalculada.getPais() %>
		            </p>
		        </div>

		        <p class="valor-resultado">
		            <%= resultadoCalculo %>
		        </p>

		    </div>

		<%
		}

		ArrayList<Viagem> listaViagens =
		        (ArrayList<Viagem>) request.getAttribute("agenciadeviagens");

		if (listaViagens == null) {
		    listaViagens = new ArrayList<Viagem>();
		}

		DecimalFormat df = new DecimalFormat("0.00");
		%>

		<table class="tabela-viagens">
			<tr>
				<th>ID</th>
				<th>Destino</th>
				<th>País</th>
				<th>Duração<br>(dias)
				</th>
				<th>Diária<br>(R$)
				</th>
				<th>Data</th>
				<th>Transporte</th>
				<th>Passagem<br>(R$)
				</th>
				<th>N° Pessoas</th>
				<th>Ações</th>
			</tr>
			<%
			for (Viagem viagem : listaViagens) {
				out.println("<tr>");
				out.println("<td>" + viagem.getId() + "</td>");
				out.println("<td>" + viagem.getDestino() + "</td>");
				out.println("<td>" + viagem.getPais() + "</td>");
				out.println("<td>" + viagem.getDuracao() + "</td>");
				out.println("<td>" + viagem.getVDiaria() + "</td>");
				out.println("<td>" + viagem.getDtViagem() + "</td>");
				out.println("<td>" + viagem.getMeioTrans() + "</td>");
				out.println("<td>" + viagem.getValorPassagem() + "</td>");
				out.println("<td>" + viagem.getNPessoas() + "</td>");

				out.println("<td class='acoes'>");

				out.println("<a class='btn-excluir' title='Excluir viagem' href=\"ViagemController?operacao=remover&id="
				+ viagem.getId() + "\"><img src='lixeira.png' height='20'></a>");

				out.println("<a class='btn-editar' title='Editar viagem' href=\"ViagemController?operacao=editar&id="
				+ viagem.getId() + "\"><img src='editar.png' height='20'></a>");
				
				out.println("<details class=\"mais-informacoes\">");

				out.println("<summary class=\"btn-informacoes\">");
				out.println("<img src=\"informacoes.png\" height=\"20\" alt=\"Mais informações\">");
				out.println("<span class=\"tooltip\">Mais informações sobre esta viagem</span>");
				out.println("</summary>");

				out.println("<div class=\"menu-calculos\">");

				out.println("<p>Informações da viagem</p>");

				out.println("<a href=\"ViagemController?operacao=calcular&tipo=total&id="
				        + viagem.getId() + "\">Custo total</a>");

				out.println("<a href=\"ViagemController?operacao=calcular&tipo=pessoa&id="
				        + viagem.getId() + "\">Custo por pessoa</a>");

				out.println("<a href=\"ViagemController?operacao=calcular&tipo=dataFinal&id="
				        + viagem.getId() + "\">Data final da viagem</a>");

				out.println("</div>");

				out.println("</details>");
				
				out.println("</td>");
			}
			%>

		</table>
		<a href="indexViagem.html" class="voltar"> <span
			class="material-symbols-outlined"> arrow_back </span> Início
		</a>
	</div>
</body>
</html>