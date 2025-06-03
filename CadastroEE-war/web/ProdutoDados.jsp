<%-- 
    Document   : ProdutoDados
    Created on : 2 de jun. de 2025, 23:44:00
    Author     : Ivan
--%>

<!-- ProdutoDados.jsp atualizado -->
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
    <h3><%= (produto == null) ? "Incluir Novo Produto" : "Alterar Produto" %></h3>

    <% if (request.getAttribute("erro") != null) { %>
        <p style="color:red;"><%= request.getAttribute("erro") %></p>
    <% } %>

    <form action="ServletProdutoFC" method="post">
        <input type="hidden" name="acao" value="<%= acao %>" />
        <% if (produto != null) { %>
            <input type="hidden" name="idProduto" value="<%= produto.getIdProduto() %>" />
        <% } %>

        <label>Nome:</label>
        <input type="text" name="nome" required value="<%= (produto != null) ? produto.getNome() : "" %>" />
        <br/>
        <label>Quantidade:</label>
        <input type="number" name="quantidade" required min="0" step="1" value="<%= (produto != null) ? produto.getQuantidade() : "" %>" />
        <br/>
        <label>Preço de Venda:</label>
        <input type="number" name="precoVenda" required min="0" step="0.01" value="<%= (produto != null) ? produto.getPrecoVenda() : "" %>" />
        <br/>
        <input type="submit" value="<%= (produto == null) ? "Incluir Produto" : "Alterar Produto" %>" />
    </form>
</body>
</html>
