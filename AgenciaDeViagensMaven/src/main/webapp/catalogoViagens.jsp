<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList,VO.Viagem"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Catálogo de viagens </title>
</head>
<body>
	<h3>Pacotes de Viagens Disponíveis</h3>

		<%
		String mensagem = (String) request.getAttribute("mensagem");
		String tipoMensagem = (String) request.getAttribute("tipoMensagem");
		
		if (mensagem != null) {
		    String cor = "sucesso".equals(tipoMensagem) ? "green" : "red";
		%>
		    <p style="color: <%= cor %>;"><%= mensagem %></p>
		<%
		}
		
		ArrayList<Viagem> listaViagens =
		    (ArrayList<Viagem>) request.getAttribute("agenciadeviagens");
		
		if (listaViagens == null) {
		    listaViagens = new ArrayList<Viagem>();
		}
		%>
	
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Destino</th>
			<th>País</th>
			<th>Duração(dias)</th>
			<th>Diária(R$)</th>
			<th>Data</th>
			<th>Transporte</th>
			<th>Passagem(R$)</th>
			<th>N° Pessoas</th>
		</tr>
		<%
		for (Viagem viagem : listaViagens){
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

			out.println("<td><a href=\"ViagemController?operacao=remover&id=" + viagem.getId() + "\"><img src=\"lixeira.png\" height=\"20\"></a></td>");
			out.println("<td><a href=\"ViagemController?operacao=editar&id=" + viagem.getId() + "\"><img src=\"editar.png\" height=\"20\"></a></td>");
			out.println("</tr>");
		}
		
		%>
		
		</table>
		<p> <a href = "indexViagem.html"> Inicio</a><br>
	
		<a href = "FormViagem.jsp"><input type = "button" value="Nova Viagem"></a><br><br>
	

</body>
</html>