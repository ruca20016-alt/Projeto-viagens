<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="VO.Viagem, java.time.LocalDate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="confirmacao.css">
<title>Confirmação do formulário</title>
</head>
<body>
<div class="container">

<h1>Informações da Viagem</h1>

<%
    String destino = request.getParameter("destino");
    String pais = request.getParameter("pais");
    String duracaoS = request.getParameter("duracao");
    String vDiariaS = request.getParameter("vDiaria");
    String dtViagemS = request.getParameter("dtViagem");
    String[] meioTrans = request.getParameterValues("meioTrans");
    String nPessoasS = request.getParameter("nPessoas");
    String operacao = request.getParameter("operacao");

    int duracao = Integer.parseInt(duracaoS);
    double vDiaria = Double.parseDouble(vDiariaS);
    int nPessoas = Integer.parseInt(nPessoasS);

    LocalDate dtViagem = LocalDate.parse(dtViagemS);

    Viagem viagem = new Viagem(
        destino,
        pais,
        duracao,
        vDiaria,
        dtViagem,
        meioTrans,
        nPessoas
    );

    out.println("<p><b>Destino:</b> " + destino + "</p>");
    out.println("<p><b>País:</b> " + pais + "</p>");
    out.println("<p><b>Duração:</b> " + duracao + " dias</p>");
    out.println("<p><b>Valor da diária:</b> R$ " + vDiaria + "</p>");
    out.println("<p><b>Data da viagem:</b> " + dtViagem + "</p>");

    out.println("<p><b>Meios de transporte:</b></p>");
    if (meioTrans != null) {
        for (String meio : meioTrans) {
            out.println("<p>" + meio + "</p>");
        }
    } else {
        out.println("<p>Nenhum selecionado</p>");
    }

    out.println("<p><b>Número de pessoas:</b> " + nPessoas + "</p>");

    out.println("<h2>Resultado da Operação</h2>");

    if ("total".equals(operacao)) {
        out.println("<p><b>Custo total:</b> R$ " + viagem.calcularCustoTotal() + "</p>");
    } else if ("pessoa".equals(operacao)) {
        out.println("<p><b>Custo por pessoa:</b> R$ " + viagem.calcularCustoPorPessoa() + "</p>");
    } else if ("data".equals(operacao)) {
        out.println("<p><b>Data final da viagem:</b> " + viagem.calcularDiaFinalViagem() + "</p>");
    }
%>

<form action="Formulario.jsp">
    <button class="btn-voltar" type="submit">Voltar</button>
</form>

</div>
</body>
</html>
