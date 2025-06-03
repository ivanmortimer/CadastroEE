<%-- 
    Document   : ProdutoLista
    Created on : 2 de jun. de 2025, 23:41:40
    Author     : Ivan
--%>

<%@page import="cadastroee.model.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lista de Produtos</title>
    </head>
    <body>
        <h3>Listagem de Produtos:</h3>
        <a href="ServletProdutoFC?acao=formIncluir">Incluir Produto</a>
        <table border="1" width="80%">
            <tr>
                <th>Id</th>
                <th>Nome</th>
                <th>Quantidade</th>
                <th>Preço de Venda</th>
                <th>Opções</th>
            </tr>
            <%
                List<Produto> lista = (List<Produto>) request.getAttribute("listaProduto");
                if (lista != null) {
                    for (Produto p : lista) {
            %>
            <tr>
                <td><%= p.getIdProduto() %></td>
                <td><%= p.getNome() %></td>
                <td><%= p.getQuantidade() %></td>
                <td><%= String.format("%.2f", p.getPrecoVenda()) %></td>
                <td>
                    <a href="ServletProdutoFC?acao=formAlterar&idProduto=<%= p.getIdProduto() %>">Alterar</a> |
                    <a href="ServletProdutoFC?acao=excluir&idProduto=<%= p.getIdProduto() %>">Excluir</a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </body>
</html>
