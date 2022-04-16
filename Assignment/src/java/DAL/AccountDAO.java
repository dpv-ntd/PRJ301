/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.Account;

/**
 *
 * @author MyPC
 */
public class AccountDAO extends BaseDAO<Account> {

    public Account getAccount(String username, String password) {
        try {
            String sql = "SELECT * FROM Account where Username = ? and Password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account s = new Account();
                s.setAccountID(rs.getInt("AccountID"));
                s.setName(rs.getString("Name"));
                s.setDOB(rs.getDate("DOB"));
                s.setAddress(rs.getString("Address"));
                s.setEmail(rs.getString("Email"));
                s.setPhoneNumber(rs.getString("PhoneNumber"));
                s.setUsername(rs.getString("Username"));
                s.setPassword(rs.getString("Password"));
                s.setRole(rs.getInt("Role"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
