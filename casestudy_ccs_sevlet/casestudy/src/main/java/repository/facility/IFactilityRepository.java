package repository.facility;

import model.facility.Facility;

import java.util.List;

public interface IFactilityRepository {
    boolean add(Facility facility);

    boolean edit(Facility facility,int id);

    boolean delete(int id);

    List<Facility> search();
    List<Facility> findAll();
    Facility searchFacility(int id_search);
//    List<ServiceType> getServiceTypeList();
//    List<RentalType> getRentalTypeList();
}
