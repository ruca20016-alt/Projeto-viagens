<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<title>Formulário de Viagens</title>

<link rel="stylesheet" href="Style.css">

</head>
<body>

<div class="container">

    <h1>Cadastro de Viagem</h1>

    <form action="processo.jsp" method="post">

        <label>Destino</label>
        <input type="text" name="destino" required>

        <label>País</label>
        <input type="text" name="pais" required>

        <label>Duração (dias)</label>
        <input type="number" name="duracao" min="1" required>

        <label>Valor da diária</label>
        <input type="number" name="vDiaria" step="0.01" required>

        <label>Data da viagem</label>
        <input type="date" name="dtViagem" required>

        <label>Meios de transporte</label>
        <div class="checkbox-group">
            <label><input type="checkbox" name="meioTrans" value="onibus"> Ônibus</label>
            <label><input type="checkbox" name="meioTrans" value="aviao"> Avião</label>
            <label><input type="checkbox" name="meioTrans" value="cruzeiro"> Cruzeiro</label>
        </div>

        <label>Número de pessoas</label>
        <input type="number" name="nPessoas" min="1" required>

        <input type="submit" value="Adicionar Viagem">

    </form>

</div>

</body>
</html>