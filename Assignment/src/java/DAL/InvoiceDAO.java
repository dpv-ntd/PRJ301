/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Cart;
import Model.Invoice;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DPV
 */
public class InvoiceDAO extends BaseDAO<Invoice> {

    public void createInvoice(String InvoiceID, String ReaderID, int AccountID, String BorrowDate) {
        try {
            String sql = "INSERT INTO Invoice (InvoiceID, ReaderID, AccountID, BorrowDate) VALUES(?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, InvoiceID);
            statement.setString(2, ReaderID);
            statement.setInt(3, AccountID);
            statement.setString(4, BorrowDate);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void createInvoiceDetails(String InvoiceID, Map<String, Cart> carts) {
        try {
            String sql = "INSERT INTO InvoiceDetails(InvoiceID, BookID, Paid) VALUES (?,?,0)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, InvoiceID);
            for (Map.Entry<String, Cart> entry : carts.entrySet()) {
                String key = entry.getKey();
                Cart value = entry.getValue();

                statement.setString(2, value.getBook().getBookID());
                statement.executeUpdate();
            }

        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
