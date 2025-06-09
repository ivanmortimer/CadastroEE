<%-- 
    Document   : ProdutoDados00
    Created on : 8 de jun. de 2025, 22:53:51
    Author     : Ivan
--%>

<%@page import="cadastroee.model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Produto produto = (Produto) request.getAttribute("produto");
    String acao = (produto == null) ? "incluir" : "alterar";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= (produto == null) ? "Incluir Produto" : "Alterar Produto" %></title>
    <style>
        label {
            display: inline-block;
            width: 120px;
        }
    </style>
</head>
<body>
    <h2><%= (produto == null) ? "Dados do Novo Produto" : "Dados do Produto" %></h2>

    <% if (request.getAttribute("erro") != null) { %>
        <p style="color:red;"><%= request.getAttribute("erro") %></p>
    <% } %>

    <form action="ServletProdutoFC" method="post">
        <input type="hidden" name="acao" value="<%= acao %>" />
        <% if (produto != null) { %>
            <input type="hidden" name="idProduto" value="<%= produto.getIdProduto() %>" />
        <% } %>
        <div>
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" required value="<%= (produto != null) ? produto.getNome() : "" %>" />
        </div>
        <div>
            <label for="quantidade">Quantidade:</label>
            <input type="number" id="quantidade" name="quantidade" required min="0" step="1" value="<%= (produto != null) ? produto.getQuantidade() : "" %>" />
        </div>
        <div>
            <label for="precoVenda">Preço de Venda:</label>
            <input type="text" id="precoVenda" name="precoVenda" required min="0" step="0.01" value="<%= (produto != null) ? String.format(java.util.Locale.forLanguageTag("pt-BR"), "%.2f", produto.getPrecoVenda()) : "" %>" pattern="\d+(\.|,)?\d*" title="Digite um valor decimal não negativo com ponto ou vírgula" />
        </div>
        <input type="submit" value="<%= (produto == null) ? "Incluir Produto" : "Alterar Produto" %>" />
    </form>
</body>
</html>
