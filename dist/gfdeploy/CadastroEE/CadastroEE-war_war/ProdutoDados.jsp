<%-- 
    Document   : ProdutoDados
    Created on : 2 de jun. de 2025, 23:44:00
    Author     : Ivan
--%>

<%@page import="cadastroee.model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Produto produto = (Produto) request.getAttribute("produto");
    boolean editando = (produto != null);
    String acao = editando ? "alterar" : "incluir";
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title><%= editando ? "Alterar" : "Incluir" %> Produto</title>
        <style>
            label { display: inline-block; width: 120px; }
        </style>
    </head>
    <body>
        <h3><%= editando ? "Alterar" : "Incluir" %> Produto:</h3>
        <form action="ServletProdutoFC" method="post">
            <% if (editando) { %>
                <input type="hidden" name="idProduto" value="<%= produto.getIdProduto() %>"/>
            <% } %>
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" value="<%= editando ? produto.getNome() : "" %>"/><br/>

            <label for="quantidade">Quantidade:</label>
            <input type="number" id="quantidade" name="quantidade" value="<%= editando ? produto.getQuantidade() : "" %>"/><br/>

            <label for="precoVenda">Preço de Venda:</label>
            <input type="text" id="precoVenda" name="precoVenda" value="<%= editando ? produto.getPrecoVenda() : "" %>"/><br/>

            <input type="hidden" name="acao" value="<%= acao %>"/>
            <input type="submit" value="<%= editando ? "Alterar" : "Incluir" %>"/>
        </form>
    </body>
</html>
