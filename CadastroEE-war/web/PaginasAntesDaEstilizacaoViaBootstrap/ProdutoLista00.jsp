<%-- 
    Document   : ProdutoLista00
    Created on : 8 de jun. de 2025, 22:54:17
    Author     : Ivan
--%>

<%@page import="java.util.List"%>
<%@page import="cadastroee.model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listagem de Produtos</title>
</head>
<body>
    <h2>Listagem de Produtos</h2>
    
    <a href="ServletProdutoFC?acao=formIncluir">Novo Produto</a>
    
    <table>
        <thead>
            <tr>
                <th>Id</th>
                <th>Nome</th>
                <th>Quantidade</th>
                <th>Preço de Venda</th>
                <th>Opções</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Produto> listaProduto = (List<Produto>) request.getAttribute("listaProduto");
                if (listaProduto != null) {
                    for (Produto p : listaProduto) {
            %>
            <tr>
                <td><%= p.getIdProduto() %></td>
                <td><%= p.getNome() %></td>
                <td><%= p.getQuantidade() %></td>
                <td><%= String.format("%.2f", p.getPrecoVenda()) %></td>
                <td>
                    <a href="ServletProdutoFC?acao=formAlterar&idProduto=<%= p.getIdProduto() %>">Alterar</a>
                    <a href="ServletProdutoFC?acao=excluir&idProduto=<%= p.getIdProduto() %>">Excluir</a>
                </td>
            </tr>
            <%      }
                }
            %>
        </tbody>
    </table>
</body>
</html>
