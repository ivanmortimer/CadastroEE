/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cadastroee.servlets;

import cadastroee.model.Produto;
import cadastroee.controller.ProdutoFacadeLocal;
import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Ivan
 */
@WebServlet(name = "ServletProdutoFC", urlPatterns = {"/ServletProdutoFC"})
public class ServletProdutoFC extends HttpServlet {
    
    @EJB
    ProdutoFacadeLocal facade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Corrige problema de acentuação
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String acao = request.getParameter("acao");
        if (acao == null) {
            acao = "listar";
        }

        String destino;
        if (acao.equals("formIncluir") || acao.equals("formAlterar")) {
            destino = "ProdutoDados.jsp";
        } else {
            destino = "ProdutoLista.jsp";
        }

        try {
            switch (acao) {
                case "listar" -> {
                    request.setAttribute("listaProduto", facade.findAll());
                }

                case "formAlterar" -> {
                    Integer id = Integer.valueOf(request.getParameter("idProduto"));
                    Produto produto = facade.find(id);
                    request.setAttribute("produto", produto);
                }

                case "excluir" -> {
                    Integer id = Integer.valueOf(request.getParameter("idProduto"));
                    Produto produto = facade.find(id);
                    if (produto != null) {
                        facade.remove(produto);
                    }
                    request.setAttribute("listaProduto", facade.findAll());
                }

                case "alterar" -> {
                    String idStr = request.getParameter("idProduto");
                    String nome = request.getParameter("nome");
                    String quantidadeStr = request.getParameter("quantidade");
                    String precoVendaStr = request.getParameter("precoVenda");

                    if (nome == null || nome.isBlank() ||
                        quantidadeStr == null || quantidadeStr.isBlank() ||
                        precoVendaStr == null || precoVendaStr.isBlank()) {
                        request.setAttribute("erro", "Todos os campos devem ser preenchidos.");
                        request.setAttribute("produto", facade.find(Integer.valueOf(idStr)));
                        destino = "ProdutoDados.jsp";
                        break;
                    }

                    try {
                        Integer id = Integer.valueOf(idStr);
                        int quantidade = Integer.parseInt(quantidadeStr);
                        Float precoVenda = Float.valueOf(precoVendaStr.replace(',', '.'));

                        Produto produto = facade.find(id);
                        if (produto != null) {
                            produto.setNome(nome);
                            produto.setQuantidade(quantidade);
                            produto.setPrecoVenda(precoVenda);
                            facade.edit(produto);
                        }

                        request.setAttribute("listaProduto", facade.findAll());
                    } catch (NumberFormatException e) {
                        request.setAttribute("erro", "Quantidade e Preço devem ser valores numéricos.");
                        request.setAttribute("produto", facade.find(Integer.valueOf(idStr)));
                        destino = "ProdutoDados.jsp";
                    }
                }

                case "incluir" -> {
                    String nome = request.getParameter("nome");
                    String quantidadeStr = request.getParameter("quantidade");
                    String precoVendaStr = request.getParameter("precoVenda");

                    if (nome == null || nome.isBlank() ||
                        quantidadeStr == null || quantidadeStr.isBlank() ||
                        precoVendaStr == null || precoVendaStr.isBlank()) {
                        request.setAttribute("erro", "Todos os campos devem ser preenchidos.");
                        destino = "ProdutoDados.jsp";
                        break;
                    }

                    try {
                        int quantidade = Integer.parseInt(quantidadeStr);
                        Float precoVenda = Float.valueOf(precoVendaStr.replace(',', '.'));

                        Produto novoProduto = new Produto();
                        novoProduto.setNome(nome);
                        novoProduto.setQuantidade(quantidade);
                        novoProduto.setPrecoVenda(precoVenda);

                        facade.create(novoProduto);
                        request.setAttribute("listaProduto", facade.findAll());
                    } catch (NumberFormatException e) {
                        request.setAttribute("erro", "Quantidade e Preço devem ser valores numéricos.");
                        destino = "ProdutoDados.jsp";
                    }
                }
            }
        } catch (NumberFormatException ex) {
            // Logar o erro e encaminhar para página de erro (opcional)
            request.setAttribute("erro", "Erro interno: " + ex.getMessage());
            destino = "ProdutoDados.jsp";
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(destino);
        dispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "ServletProdutoFC - Front Controller para gerenciamento da tabela 'Produto' do esquema 'dbo' do banco de dados 'loja' (SGBD SQL Server).";
    }// </editor-fold>
}
