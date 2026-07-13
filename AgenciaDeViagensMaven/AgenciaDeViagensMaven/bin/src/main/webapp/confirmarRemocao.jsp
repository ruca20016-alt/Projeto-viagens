<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="VO.Viagem"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remoção da viagem</title>
</head>
<body>

    <h3>Remoção da viagem</h3>

    <%
        Viagem viagem = (Viagem) request.getAttribute("viagem");
    %>

    <ul>
        <li>ID: <%= viagem.getId() %></li>
        <li>Destino: <%= viagem.getDestino() %></li>
        <li>País: <%= viagem.getPais() %></li>
        <li>Duração: <%= viagem.getDuracao() %></li>
        <li>Diária: <%= viagem.getVDiaria() %></li>
        <li>Data: <%= viagem.getDtViagem() %></li>
        <li>Transporte: <%= viagem.getMeioTrans() %></li>
        <li>Passagem: <%= viagem.getValorPassagem() %></li>
        <li>N° Pessoas: <%= viagem.getNPessoas() %></li>
    </ul>

    <p>Tem certeza que deseja remover essa viagem?</p>

    <form action="ViagemController" method="post">
    	<input type="hidden" name="id" value="<%= viagem.getId() %>">
    	<input type="hidden" name="operacao" value="remover">

    	<input type="submit" value="Remover"><br><br>
	</form>

    <a href="index.html">
        <input type="button" value="Cancelar">
    </a>

</body>
</html>