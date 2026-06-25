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
			String classeMensagem = "sucesso".equals(tipoMensagem) ? "mensagem-sucesso" : "mensagem-erro";
		%>
		<p class="<%=classeMensagem%>"><%=mensagem%></p>
		<%
		}

		ArrayList<Viagem> listaViagens = (ArrayList<Viagem>) request.getAttribute("agenciadeviagens");

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
				<th>Custo Total</th>
				<th>Custo por<br>Pessoa
				</th>
				<th>Data Final</th>
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
				out.println("<td>R$ " + df.format(viagem.calcularCustoTotal()) + "</td>");
				out.println("<td>R$ " + df.format(viagem.calcularCustoPorPessoa()) + "</td>");
				out.println("<td>" + viagem.calcularDataFinalViagem() + "</td>");

				out.println("<td class='acoes'>");

				out.println("<a class='btn-excluir' title='Excluir viagem' href=\"ViagemController?operacao=remover&id="
				+ viagem.getId() + "\"><img src='lixeira.png' height='20'></a>");

				out.println("<a class='btn-editar' title='Editar viagem' href=\"ViagemController?operacao=editar&id="
				+ viagem.getId() + "\"><img src='editar.png' height='20'></a>");
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