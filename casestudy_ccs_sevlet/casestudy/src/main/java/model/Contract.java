package model;

import java.time.LocalDate;

public class Contract {
    private String contractID;
    private LocalDate startDate;
    private LocalDate endDate;
    private double deposit;
    private int totalBill;

    public Contract() {
    }

    public Contract(String contractID, LocalDate startDate, LocalDate endDate, double deposit, int totalBill) {
        this.contractID = contractID;
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

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
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
