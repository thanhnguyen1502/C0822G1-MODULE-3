package service.impl;

import model.model.Contract;
import repository.impl.ContractRepository;
import repository.IContractRepository;
import service.IContractService;

import java.util.List;

public class ContractService implements IContractService {
    private IContractRepository contractRepository = new ContractRepository();

    @Override
    public List<Contract> selectAllContract() {
        return contractRepository.selectAllContract();
    }
}
