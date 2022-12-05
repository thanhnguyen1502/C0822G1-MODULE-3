package service.impl;

import model.RentType;
import model.facility.Facility;
import model.facility.FacilityType;
import repository.IFacilityRepository;
import repository.impl.BaseRepository;
import repository.impl.FacilityRepository;
import service.IFacitityService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FacilityService implements IFacitityService {
    private IFacilityRepository facilityRepository = new FacilityRepository();
    @Override
    public List<Facility> selectAllService() {
        return facilityRepository.selectAllService();
    }

    @Override
    public void addNewFacility(Facility facility) {
        facilityRepository.addNewFacility(facility);
    }

    @Override
    public void deleteFacility(int id) {
        facilityRepository.deleteFacility(id);
    }

    @Override
    public Facility findFacilityById(int idSearch) {
        return facilityRepository.findFacilityById(idSearch);
    }

    @Override
    public List<FacilityType> facilityTypeList() {
        return facilityRepository.facilityTypeList();
    }

    @Override
    public List<RentType> rentTypeList() {
        return facilityRepository.rentTypeList();
    }

    @Override
    public List<Facility> searchFacility(String keySearch) {
        return facilityRepository.searchFacility(keySearch);
    }
}
