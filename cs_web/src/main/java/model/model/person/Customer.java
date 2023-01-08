package model.model.person;

import java.time.LocalDate;

public class Customer extends Person{
    private int customerID;
    private String customerType;
    private String address;

    public Customer(){

    }

    public Customer(int customerID, String customerType, String address) {
        this.customerID = customerID;
        this.customerType = customerType;
        this.address = address;
    }

    public Customer(String name, LocalDate birthday, boolean gender, String id, String phoneNumber, String email, int customerID, String customerType, String address) {
        super(name, birthday, gender, id, phoneNumber, email);
        this.customerID = customerID;
        this.customerType = customerType;
        this.address = address;
    }

    public Customer(String name, LocalDate birthday, boolean gender, String id, String phoneNumber, String email, String customerType, String address) {
        super(name, birthday, gender, id, phoneNumber, email);
        this.customerType = customerType;
        this.address = address;
    }



    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCustomerTypeId(String customerType){
        String value = "0";
        switch (customerType){
            case "Diamond":
                value = "1";
                break;
            case "Platinium":
                value = "2";
                break;
            case "Gold":
                value = "3";
                break;
            case "Silver":
                value = "4";
                break;
            case "Member":
                value = "5";
                break;
        }
        return value;
    }
}
