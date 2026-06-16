<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList , VO.Viagem"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Lista de Viagens</h3>
	
	<%
		ArrayList<Viagem> listaViagens = (ArrayList<Viagem>) request.getAttribute("agenciadeviagens");
	%>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Destino</th>
			<th>País</th>
			<th>Duração</th>
			<th>Diária</th>
			<th>Data</th>
			<th>Transporte</th>
			<th>Passagem</th>
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
			out.println("<td><a href = \"TarefaController?operacao=Buscar&simbolo=lixeira&id=" + viagem.getId() + "\"><img src = \"lixeira.png\" height = \"20px\"></a></td>");
			out.println("<td><a href = \"TarefaController?operacao=Buscar&simbolo=editar&id=" + viagem.getId() + "\"><img src = \"editar.png\" height = \"20px\"></a></td>");
			out.println("<tr>");
		}
		
		%>
		
		</table>
		<p> <a href = "indexViagem.html"> Inicio</a>
	

</body>
</html>