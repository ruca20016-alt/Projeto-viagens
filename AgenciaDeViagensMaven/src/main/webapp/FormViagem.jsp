<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="VO.Viagem"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<title>Formulário de Viagem</title>
<link rel="stylesheet" href="style.css">
</head>
<body class="pagina-catalogo">

	<%
	Viagem viagem = (Viagem) request.getAttribute("viagem");

	boolean editar = viagem != null;

	String operacao = editar ? "atualizar" : "cadastrar";
	String titulo = editar ? "Atualizar Viagem" : "Cadastrar Viagem";
	String subtitulo = editar ? "Edite as informações do pacote selecionado."
			: "Preencha os dados do novo pacote de viagem.";
	String textoBotao = editar ? "Atualizar Viagem" : "Adicionar Viagem";
	String transporte = editar ? viagem.getMeioTrans() : "";
	%>

	<div class="form-card">

		<div class="form-header">
			<h1><%=titulo%></h1>
			<p><%=subtitulo%></p>
		</div>

		<form action="ViagemController?operacao=<%=operacao%>" method="post">

			<%
			if (editar) {
			%>
			<input type="hidden" name="id" value="<%=viagem.getId()%>">
			<%
			}
			%>

			<div class="form-section">
				<h2>Informações da Viagem</h2>

				<div class="form-grid">

					<div class="form-group">
						<label>Destino</label> <input type="text" name="destino"
							placeholder="Ex: Paris"
							value="<%= editar ? viagem.getDestino() : "" %>" required>
					</div>

					<div class="form-group">
						<label>País</label> <input type="text" name="pais"
							placeholder="Ex: França"
							value="<%= editar ? viagem.getPais() : "" %>" required>
					</div>

					<div class="form-group">
						<label>Duração (dias)</label> <input type="number" name="duracao"
							placeholder="Ex: 7"
							value="<%= editar ? viagem.getDuracao() : "" %>" min="1" required>
					</div>

					<div class="form-group">
						<label>Data da viagem</label> <input type="date" name="dtViagem"
							value="<%= editar ? viagem.getDtViagem() : "" %>" required>
					</div>

				</div>
			</div>

			<div class="form-section">
				<h2>Custos</h2>

				<div class="form-grid">

					<div class="form-group">
						<label>Valor da diária (R$)</label> <input type="number"
							name="vDiaria" placeholder="Ex: 350.00"
							value="<%= editar ? viagem.getVDiaria() : "" %>" min="0"
							step="0.01" required>
					</div>

					<div class="form-group">
						<label>Valor da passagem (R$)</label> <input type="number"
							name="valorPassagem" placeholder="Ex: 2500.00"
							value="<%= editar ? viagem.getValorPassagem() : "" %>" min="0"
							step="0.01" required>
					</div>

					<div class="form-group">
						<label>Número de pessoas</label> <input type="number"
							name="nPessoas" placeholder="Ex: 2"
							value="<%= editar ? viagem.getNPessoas() : "" %>" min="1"
							step="1" required>
					</div>

				</div>
			</div>

			<div class="form-section">
				<h2>Transporte</h2>

				<div class="radio-group">

					<label> <input type="radio" name="meioTrans" value="onibus"
						<%= "onibus".equals(transporte) ? "checked" : "" %> required>
						Ônibus
					</label> <label> <input type="radio" name="meioTrans" value="aviao"
						<%= "aviao".equals(transporte) ? "checked" : "" %>> Avião
					</label> <label> <input type="radio" name="meioTrans"
						value="cruzeiro"
						<%= "cruzeiro".equals(transporte) ? "checked" : "" %>>
						Cruzeiro
					</label>

				</div>
			</div>

			<input class="botao-principal" type="submit" value="<%=textoBotao%>">
		</form>

	</div>

</body>
</html>