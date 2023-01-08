package repository;

import model.model.RentType;
import model.model.facility.Facility;
import model.model.facility.FacilityType;

import java.util.List;

public interface IFacilityRepository {

    List<Facility> selectAllService();

    void addNewFacility(Facility facility);

    void deleteFacility(int id);

    Facility findFacilityById(int idSearch);

    List<FacilityType> facilityTypeList();

    List<RentType> rentTypeList();

    List<Facility> searchFacility(String keySearch);
}
