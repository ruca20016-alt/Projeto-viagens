<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="VO.Viagem"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<title>Formulário de Viagem</title>
<link rel="stylesheet" href="Style.css">
</head>
<body>

<%
Viagem viagem = (Viagem) request.getAttribute("viagem");

boolean editar = viagem != null;

String operacao = editar ? "atualizar" : "cadastrar";
String titulo = editar ? "Atualizar Viagem" : "Cadastrar Viagem";
String textoBotao = editar ? "Atualizar Viagem" : "Adicionar Viagem";
String transporte = editar ? viagem.getMeioTrans() : "";
%>

<div class="container">

    <h1><%= titulo %></h1>

	<form action="ViagemController?operacao=<%= operacao %>" method="post">
        <% if (editar) { %>
        	<label>Id</label>
            <input type="number" name="id" value="<%= viagem.getId() %>" readonly>
        <% } %>

        <label>Destino</label>
        <input type="text" name="destino" value="<%= editar ? viagem.getDestino() : "" %>" required>

        <label>País</label>
        <input type="text" name="pais" value="<%= editar ? viagem.getPais() : "" %>" required>

        <label>Duração (dias)</label>
        <input type="number" name="duracao" value="<%= editar ? viagem.getDuracao() : "" %>" min="1" required>

        <label>Valor da diária(R$)</label>
        <input type="number" name="vDiaria" value="<%= editar ? viagem.getVDiaria() : "" %>" min="0" step="0.01" required>

        <label>Data da viagem</label>
        <input type="date" name="dtViagem" value="<%= editar ? viagem.getDtViagem() : "" %>" required>

        <label>Meios de transporte</label>
        <div class="checkbox-group">
            <label>
                <input type="radio" name="meioTrans" value="onibus"
                    <%= "onibus".equals(transporte) ? "checked" : "" %> required>
                Ônibus
            </label>

            <label>
                <input type="radio" name="meioTrans" value="aviao"
                    <%= "aviao".equals(transporte) ? "checked" : "" %>>
                Avião
            </label>

            <label>
                <input type="radio" name="meioTrans" value="cruzeiro"
                    <%= "cruzeiro".equals(transporte) ? "checked" : "" %>>
                Cruzeiro
            </label>
        </div>

        <label>Valor da Passagem(R$)</label>
        <input type="number" name="valorPassagem" value="<%= editar ? viagem.getValorPassagem() : "" %>" min="0" step="0.01" required>

        <label>Número de pessoas</label>
        <input type="number" name="nPessoas" value="<%= editar ? viagem.getNPessoas() : "" %>" min="1" step="1" required>

        <input type="submit" value="<%= textoBotao %>">
    </form>

</div>

</body>
</html>