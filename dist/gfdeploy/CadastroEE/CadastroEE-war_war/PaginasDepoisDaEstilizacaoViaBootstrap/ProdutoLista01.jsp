<%-- 
    Document   : ProdutoLista01
    Created on : 8 de jun. de 2025, 23:37:09
    Author     : Ivan
--%>

<!-- ProdutoLista.jsp atualizado -->
<%@page import="java.util.List"%>
<%@page import="cadastroee.model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listagem de Produtos</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="container">
    <h2 class="mt-4 mb-4">Listagem de Produtos</h2>
    
    <a href="ServletProdutoFC?acao=formIncluir" class="btn btn-primary m-2">Novo Produto</a>
    
    <table class="table table-striped">
        <thead class="table-dark">
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
                    <a href="ServletProdutoFC?acao=formAlterar&idProduto=<%= p.getIdProduto() %>" class="btn btn-primary btn-sm">Alterar</a>
                    <a href="ServletProdutoFC?acao=excluir&idProduto=<%= p.getIdProduto() %>" class="btn btn-danger btn-sm">Excluir</a>
                </td>
            </tr>
            <%      }
                }
            %>
        </tbody>
    </table>
</body>
</html>
