package repository;


import model.model.Contract;

import java.util.List;

public interface IContractRepository {
    List<Contract> selectAllContract();
}
