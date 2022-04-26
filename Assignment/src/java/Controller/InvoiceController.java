/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.BookDAO;
import DAL.InvoiceDAO;
import DAL.ReaderDAO;
import Model.Account;
import Model.Book;
import Model.Cart;
import Model.Reader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DPV
 */
@WebServlet(name = "InvoiceController", urlPatterns = {"/invoice"})
public class InvoiceController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InvoiceController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InvoiceController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setAttribute("invoiceMenu", "active");

        BookDAO daoBook = new BookDAO();
        ReaderDAO daoReader = new ReaderDAO();

        ArrayList<Book> listBook = daoBook.getListBook();
        ArrayList<Reader> listReader = daoReader.getListReader();
        String action = request.getParameter("action");
        if (action != null) {
            if (action.equals("create")) {
                request.setAttribute("listBook", listBook);
                request.setAttribute("listReader", listReader);
                request.getRequestDispatcher("CreateInvoice.jsp").forward(request, response);
                return;
            }
            if (action.equals("edit")) {
                request.getRequestDispatcher("EditBook.jsp").forward(request, response);
                return;
            }
            if (action.equals("delete")) {
                response.sendRedirect("book");
                return;
            }
        }

        request.getRequestDispatcher("Invoice.jsp").forward(request, response);
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

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if (action != null) {
            if (action.equals("create")) {
                Map<String, Cart> carts = (Map<String, Cart>) request.getSession().getAttribute("carts");
                if (carts == null) {
                    carts = new LinkedHashMap<>();
                }

                Account account = (Account) request.getSession().getAttribute("account");
                String InvoiceID = request.getParameter("InvoiceID");
                String ReaderID = request.getParameter("ReaderID");
                String BorrowDate = request.getParameter("BorrowDate");
                int AccountID = account.getAccountID();

                InvoiceDAO dao = new InvoiceDAO();
                dao.createInvoice(InvoiceID, ReaderID, AccountID, BorrowDate);
                dao.createInvoiceDetails(InvoiceID, carts);

                request.getSession().removeAttribute("carts");
                response.sendRedirect("invoice");
//                response.getWriter().print(InvoiceID + ", " + ReaderID + ", " + BorrowDate);
//                response.getWriter().print(carts);
                return;
            }

        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
