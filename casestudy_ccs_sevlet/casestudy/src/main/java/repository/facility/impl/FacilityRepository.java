package repository.facility.impl;

import model.facility.Facility;
import repository.facility.IFactilityRepository;

import java.util.List;


public class FacilityRepository implements IFactilityRepository {
    private final String INSERT_FACILITY ="insert into dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,ma_kieu_thue,ma_loai_dich_vu , " +
            "tieu_chuan_phong , mo_ta_tien_nghi_khac, dien_tich_ho_boi , so_tang , dich_vu_mien_phi_di_kem) values (?,?,?,?,?,?,?,?,?,?,?);";

    private final String UPDATE_FACILITY ="update dich_vu set ten_dich_vu =?,dien_tich=?,chi_phi_thue=?,so_nguoi_toi_da=?,ma_kieu_thue=?,ma_loai_dich_vu =?, " +
            "tieu_chuan_phong=? , mo_ta_tien_nghi_khac=?, dien_tich_ho_boi=? , so_tang=? , dich_vu_mien_phi_di_kem=? where ma_dich_vu=?;";

    @Override
    public boolean add(Facility facility) {
        return false;
    }

    @Override
    public boolean edit(Facility facility, int id) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public List<Facility> search() {
        return null;
    }

    @Override
    public List<Facility> findAll() {
        return null;
    }

    @Override
    public Facility searchFacility(int id_search) {
        return null;
    }
}
