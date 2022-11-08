package service;

import model.RentType;
import model.facility.Facility;
import model.facility.FacilityType;

import java.util.List;

public interface IFacitityService {

    List<Facility> selectAllService();

    void addNewFacility(Facility facility);

    void deleteFacility(int id);

    Facility findFacilityById(int idSearch);

    List<FacilityType> facilityTypeList();

    List<RentType> rentTypeList();

    List<Facility> searchFacility(String keySearch);
}
