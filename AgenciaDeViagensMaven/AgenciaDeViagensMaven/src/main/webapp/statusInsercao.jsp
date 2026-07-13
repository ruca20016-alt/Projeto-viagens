<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Status de inserção</title>
</head>
<body>
	<h3>Resultado da inserção</h3>

	<%
			boolean status = (boolean) request.getAttribute("status");
			String operacao = (String) request.getAttribute("operacao");
			String mensagem;
			
			if (status)
				mensagem = "A viagem foi " + operacao + " com sucesso!";
			else
				mensagem = "Erro! A viagem não foi " + operacao + ".";
		%>
		
		<p><%= mensagem %></p>
		
		<a href = "ViagemController?operacao=Listar"><input type = "button" value="Listar"></a><br><br>

</body>
</html>