package repository.impl;

import model.RentType;
import model.facility.Facility;
import model.facility.FacilityType;
import repository.IFacilityRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private final String SELECT_ALL_FACILITY = "SELECT f.*, ft.name as name_type, rt.name as rent_type FROM \n" +
            "furama_management.facility f \n" +
            "\tjoin facility_type ft on f.facility_type_id = ft.id \n" +
            "\tjoin rengt_type rt on f.rent_type_id = rt.id";
    private final String ADD_NEW_FACILITY = "CALL add_new_service(?,?,?,?,?,?,?,?,?,?,?);";
    private final String DELETE_FACILITY = "CALL delete_facility(?);";
    private final String FIND_FACILITY_BY_ID = "CALL find_facility_by_id(?);";
    private final String FACILITY_TYPE_LIST = "CALL facility_type_list();";
    private final String RENT_TYPE_LIST = "CALL rent_type_list();";
    private final String SEARCH_FACILITY = "CALL search_facility(?);";

    @Override
    public List<Facility> selectAllService() {
        List<Facility> facilityList = new ArrayList<>();
        Facility facility = null;

        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FACILITY);
            preparedStatement.executeQuery();
            ResultSet resultSet = preparedStatement.getResultSet();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String serviceName = resultSet.getString("name");
                int usableArea = resultSet.getInt("area");
                double cost = resultSet.getDouble("cost");
                int maxPeople = resultSet.getInt("max_people");
                String rentTypeId = resultSet.getString("rent_type");
                String serviceTypeId = resultSet.getString("name_type");
                String roomStandard = resultSet.getString("standard_room");
                double poolArea = resultSet.getDouble("pool_area");
                String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                int numberOfFloors = resultSet.getInt("number_of_floor");
                String freeServiceIncluded = resultSet.getString("facility_free");

                    facility = new Facility(id, serviceName, usableArea, cost, maxPeople, rentTypeId, serviceTypeId, roomStandard,
                        descriptionOtherConvenience, poolArea, numberOfFloors, freeServiceIncluded);
                facilityList.add(facility);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityList;
    }

    @Override
    public void addNewFacility(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();

        try {
            CallableStatement callableStatement = connection.prepareCall(ADD_NEW_FACILITY);
            callableStatement.setString(1, facility.getName());
            callableStatement.setInt(2, facility.getArea());
            callableStatement.setDouble(3, facility.getCost());
            callableStatement.setInt(4, facility.getMaxPeople());
            callableStatement.setInt(5, Integer.parseInt(facility.getRentType()));
            callableStatement.setInt(6, Integer.parseInt(facility.getFacilityType()));
            callableStatement.setString(7, facility.getStandard());
            callableStatement.setString(8, facility.getOtherConvenience());
            callableStatement.setDouble(9, facility.getPoolArea());
            callableStatement.setInt(10, facility.getFloors());
            callableStatement.setString(11, facility.getFacilityFree());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteFacility(int id) {
        Connection connection = BaseRepository.getConnectDB();

        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_FACILITY);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Facility findFacilityById(int idSearch) {
        Connection connection = BaseRepository.getConnectDB();
        Facility facility = null;

        try {
            CallableStatement callableStatement = connection.prepareCall(FIND_FACILITY_BY_ID);
            callableStatement.setInt(1, idSearch);

            int id = callableStatement.getInt("id");
            String name = callableStatement.getString("service_name");
            int area = callableStatement.getInt("usable_area");
            double cost = callableStatement.getDouble("cost");
            int maxPeople = callableStatement.getInt("max_people");
            String rentType = callableStatement.getString("rent_type");
            String facilityType = callableStatement.getString("service_type");
            String standard = callableStatement.getString("standard_room");
            String otherConvenience = callableStatement.getString("description_other_convenience");
            double poolArea = callableStatement.getDouble("pool_area");
            int floors = callableStatement.getInt("number_of_floor");
            String facilityFree = callableStatement.getString("facility_free");

            facility = new Facility(id, name, area, cost, maxPeople, rentType, facilityType, standard, otherConvenience, poolArea, floors, facilityFree);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facility;
    }

    @Override
    public List<FacilityType> facilityTypeList() {
        List<FacilityType> facilityTypeList = new ArrayList<>();
        FacilityType facilityType = null;
        Connection connection = BaseRepository.getConnectDB();

        try {
            CallableStatement callableStatement = connection.prepareCall(FACILITY_TYPE_LIST);
            callableStatement.executeQuery();
            ResultSet resultSet = callableStatement.getResultSet();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                facilityType = new FacilityType(id, name);
                facilityTypeList.add(facilityType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityTypeList;
    }

    @Override
    public List<RentType> rentTypeList() {
        List<RentType> rentTypeList = new ArrayList<>();
        RentType rentType = null;

        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(RENT_TYPE_LIST);
            callableStatement.executeQuery();
            ResultSet resultSet = callableStatement.getResultSet();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                rentType = new RentType(id, name);
                rentTypeList.add(rentType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentTypeList;
    }

    @Override
    public List<Facility> searchFacility(String keySearch) {
        List<Facility> facilityList = new ArrayList<>();
        Facility facility = null;

        Connection connection = BaseRepository.getConnectDB();

        try {
            CallableStatement callableStatement = connection.prepareCall(SEARCH_FACILITY);
            callableStatement.setString(1,keySearch);
            callableStatement.executeQuery();
            ResultSet resultSet = callableStatement.getResultSet();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String serviceName = resultSet.getString("service_name");
                int usableArea = resultSet.getInt("usable_area");
                double cost = resultSet.getDouble("cost");
                int maxPeople = resultSet.getInt("max_people");
                String rentTypeId = resultSet.getString("rent_type");
                String serviceTypeId = resultSet.getString("service_type");
                String roomStandard = resultSet.getString("standard_room");
                double poolArea = resultSet.getDouble("pool_area");
                String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                int numberOfFloors = resultSet.getInt("number_of_floor");
                String freeServiceIncluded = resultSet.getString("facility_free");
                facility = new Facility(id, serviceName, usableArea, cost, maxPeople, rentTypeId, serviceTypeId, roomStandard,
                        descriptionOtherConvenience, poolArea, numberOfFloors, freeServiceIncluded);
                facilityList.add(facility);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityList;
    }
}
