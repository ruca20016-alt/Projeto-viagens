<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirmação do formulário</title>
</head>
<body>

	<h1>Informações da Viagem</h1>

	<% 
		String destino = request.getParameter("destino");
		String pais = request.getParameter("pais");
		String duracaoS = request.getParameter("duracao");
		String vDiariaS = request.getParameter("vDiaria");
		String dtViagemS = request.getParameter("dtViagem");
		String[] meioTrans = request.getParameterValues("meioTrans");
		String nPessoasS = request.getParameter("nPessoas");
		
		int duracao = Integer.parseInt(duracaoS); 
		double vDiaria = Double.parseDouble(vDiariaS); 
		int nPessoas = Integer.parseInt(nPessoasS); 
	%>
	
	<p><b>Destino:</b> <%= destino %></p>
	<p><b>País:</b> <%= pais %></p>
	<p><b>Duração:</b> <%= duracao %></p>
	<p><b>Valor da Diaria:</b> <%= vDiaria %></p>
	<p><b>Data:</b> <%= dtViagemS %></p>
	<p><b>Meios de transporte:</b></p>
	<% 
	
	if(meioTrans != null){
		for (String meio : meioTrans){
			out.println(meioTrans);			
		}
	}
	%>
	
	<p><b>Numero de Pessoas:</b> <%= nPessoas %></p>
	
	
</body>
</html>
