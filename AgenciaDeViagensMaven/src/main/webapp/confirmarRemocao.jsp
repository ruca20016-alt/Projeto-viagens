<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="VO.Viagem"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">

<title>Confirmar remoção</title>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined">

<link rel="stylesheet" href="style.css">
</head>

<body class="pagina-remocao">

	<%
	Viagem viagem = (Viagem) request.getAttribute("viagem");
	%>

	<div class="card-remocao">

		<div class="cabecalho-remocao">
			<h1>Confirmar remoção</h1>
			<p>Revise os dados antes de excluir esta viagem.</p>
		</div>

		<div class="conteudo-remocao">

			<div class="dados-remocao">

				<p>
					<strong>ID:</strong>
					<%=viagem.getId()%>
				</p>

				<p>
					<strong>Destino:</strong>
					<%=viagem.getDestino()%>
				</p>

				<p>
					<strong>País:</strong>
					<%=viagem.getPais()%>
				</p>

				<p>
					<strong>Duração:</strong>
					<%=viagem.getDuracao()%> dias
				</p>

				<p>
					<strong>Diária:</strong>
					R$ <%=viagem.getVDiaria()%>
				</p>

				<p>
					<strong>Data:</strong>
					<%=viagem.getDtViagem()%>
				</p>

				<p>
					<strong>Transporte:</strong>
					<%=viagem.getMeioTrans()%>
				</p>

				<p>
					<strong>Passagem:</strong>
					R$ <%=viagem.getValorPassagem()%>
				</p>

				<p>
					<strong>N° de pessoas:</strong>
					<%=viagem.getNPessoas()%>
				</p>

			</div>

			<div class="aviso-remocao">
				<span class="material-symbols-outlined">warning</span>

				<p>Tem certeza de que deseja remover esta viagem?</p>
			</div>

			<div class="acoes-remocao">

				<a href="ViagemController?operacao=listar"
					class="botao-cancelar">
					Cancelar
				</a>

				<form action="ViagemController" method="post">
					<input type="hidden" name="id"
						value="<%=viagem.getId()%>">

					<input type="hidden" name="operacao"
						value="remover">

					<button type="submit" class="botao-remover">
						Remover viagem
					</button>
				</form>

			</div>

		</div>

	</div>

</body>
</html>