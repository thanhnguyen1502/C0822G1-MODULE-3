package model;

import java.time.LocalDate;
import java.util.Date;

public class Contract {
    private String contractID;
    private Date startDate;
    private Date endDate;
    private double deposit;
    private int totalBill;

    public Contract() {
    }

    public Contract(String contractID, Date startDate, Date endDate, double deposit, int totalBill) {
        this.contractID = contractID;
        this.startDate = startDate;
        this.endDate = endDate;
        this.deposit = deposit;
        this.totalBill = totalBill;
    }

    public Contract(Date startDate, Date endDate, double deposit, int totalBill) {
        this.startDate = startDate;
        this.endDate = endDate;
        this.deposit = deposit;
        this.totalBill = totalBill;
    }

    public String getContractID() {
        return contractID;
    }

    public void setContractID(String contractID) {
        this.contractID = contractID;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public double getDeposit() {
        return deposit;
    }

    public void setDeposit(double deposit) {
        this.deposit = deposit;
    }

    public int getTotalBill() {
        return totalBill;
    }

    public void setTotalBill(int totalBill) {
        this.totalBill = totalBill;
    }
}
