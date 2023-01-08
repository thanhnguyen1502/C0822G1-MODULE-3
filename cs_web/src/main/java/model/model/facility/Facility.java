package model.model.facility;

public class Facility {
    private int id;
    private String name;
    private int area;
    private double cost;
    private int maxPeople;
    private String rentType;
    private String facilityType;
    private String standard;
    private String otherConvenience;
    private double poolArea;
    private int floors;
    private String facilityFree;

    public Facility() {
    }

    public Facility(int id, String name, int area, double cost, int maxPeople, String rentType, String facilityType, String standard, String otherConvenience, double poolArea, int floors, String facilityFree) {
        this.id = id;
        this.name = name;
        this.area = area;
        this.cost = cost;
        this.maxPeople = maxPeople;
        this.rentType = rentType;
        this.facilityType = facilityType;
        this.standard = standard;
        this.otherConvenience = otherConvenience;
        this.poolArea = poolArea;
        this.floors = floors;
        this.facilityFree = facilityFree;
    }

    public Facility(String name, int area, double cost, int maxPeople, String rentType, String facilityType, String standard, String otherConvenience, double poolArea, int floors, String facilityFree) {
        this.name = name;
        this.area = area;
        this.cost = cost;
        this.maxPeople = maxPeople;
        this.rentType = rentType;
        this.facilityType = facilityType;
        this.standard = standard;
        this.otherConvenience = otherConvenience;
        this.poolArea = poolArea;
        this.floors = floors;
        this.facilityFree = facilityFree;
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

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public int getMaxPeople() {
        return maxPeople;
    }

    public void setMaxPeople(int maxPeople) {
        this.maxPeople = maxPeople;
    }

    public String getRentType() {
        return rentType;
    }

    public void setRentType(String rentType) {
        this.rentType = rentType;
    }

    public String getFacilityType() {
        return facilityType;
    }

    public void setFacilityType(String facilityType) {
        this.facilityType = facilityType;
    }

    public String getStandard() {
        return standard;
    }

    public void setStandard(String standard) {
        this.standard = standard;
    }

    public String getOtherConvenience() {
        return otherConvenience;
    }

    public void setOtherConvenience(String otherConvenience) {
        this.otherConvenience = otherConvenience;
    }

    public double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(double poolArea) {
        this.poolArea = poolArea;
    }

    public int getFloors() {
        return floors;
    }

    public void setFloors(int floors) {
        this.floors = floors;
    }

    public String getFacilityFree() {
        return facilityFree;
    }

    public void setFacilityFree(String facilityFree) {
        this.facilityFree = facilityFree;
    }
}
