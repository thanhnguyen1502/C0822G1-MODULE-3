package model;

public class Product {
    private int id;
    private String name;
    private String producer;
    private double price;
    private String status;
    private String Picture;

    public Product() {
    }

    public Product(int id, String name, String producer, double price, String status, String picture) {
        this.id = id;
        this.name = name;
        this.producer = producer;
        this.price = price;
        this.status = status;
        Picture = picture;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPicture() {
        return Picture;
    }

    public void setPicture(String picture) {
        Picture = picture;
    }
}