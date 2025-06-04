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

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <h2 class="mt-4 mb-4 ms-3"><%= (produto == null) ? "Dados do Novo Produto" : "Dados do Produto" %></h2>

    <% if (request.getAttribute("erro") != null) { %>
        <p style="color:red;"><%= request.getAttribute("erro") %></p>
    <% } %>

    <form action="ServletProdutoFC" method="post" class="form ms-3">
        <input type="hidden" name="acao" value="<%= acao %>" />
        <% if (produto != null) { %>
            <input type="hidden" name="idProduto" value="<%= produto.getIdProduto() %>" />
        <% } %>
        <div class="mb-3">
            <label for="nome" class="form-label">Nome:</label>
            <input type="text" class="form-control" id="nome" name="nome" required value="<%= (produto != null) ? produto.getNome() : "" %>" />
        </div>
        <div class="mb-3">
            <label for="quantidade" class="form-label">Quantidade:</label>
            <input type="number" class="form-control" id="quantidade" name="quantidade" required min="0" step="1" value="<%= (produto != null) ? produto.getQuantidade() : "" %>" />
        </div>
        <div class="mb-3">
            <label for="precoVenda" class="form-label">Preço de Venda:</label>
            <input type="text" class="form-control" id="precoVenda" name="precoVenda" required min="0" step="0.01" value="<%= (produto != null) ? String.format(java.util.Locale.forLanguageTag("pt-BR"), "%.2f", produto.getPrecoVenda()) : "" %>" pattern="\d+(\.|,)?\d*" title="Digite um valor decimal não negativo com ponto ou vírgula" />
        </div>
        <input type="submit" class="btn btn-primary" value="<%= (produto == null) ? "Incluir Produto" : "Alterar Produto" %>" />
    </form>
</body>
</html>
