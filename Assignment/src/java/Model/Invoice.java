/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author DPV
 */
public class Invoice {

    private String InvoiceID;
    private String ReaderID;
    private String AccountID;
    private String BorrowDate;

    public Invoice() {
    }

    public Invoice(String InvoiceID, String ReaderID, String AccountID, String BorrowDate) {
        this.InvoiceID = InvoiceID;
        this.ReaderID = ReaderID;
        this.AccountID = AccountID;
        this.BorrowDate = BorrowDate;
    }

    public String getInvoiceID() {
        return InvoiceID;
    }

    public void setInvoiceID(String InvoiceID) {
        this.InvoiceID = InvoiceID;
    }

    public String getReaderID() {
        return ReaderID;
    }

    public void setReaderID(String ReaderID) {
        this.ReaderID = ReaderID;
    }

    public String getAccountID() {
        return AccountID;
    }

    public void setAccountID(String AccountID) {
        this.AccountID = AccountID;
    }

    public String getBorrowDate() {
        return BorrowDate;
    }

    public void setBorrowDate(String BorrowDate) {
        this.BorrowDate = BorrowDate;
    }

    @Override
    public String toString() {
        return "Invoice{" + "InvoiceID=" + InvoiceID + ", ReaderID=" + ReaderID + ", AccountID=" + AccountID + ", BorrowDate=" + BorrowDate + '}';
    }

}
