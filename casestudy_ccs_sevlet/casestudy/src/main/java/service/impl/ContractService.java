package service.impl;

import model.Contract;
import repository.impl.ContractRepositosy;
import repository.IContractRepository;
import service.IContractService;

import java.util.List;

public class ContractService implements IContractService {
    private IContractRepository contractRepository = new ContractRepositosy();

    @Override
    public List<Contract> selectAllContract() {
        return contractRepository.selectAllContract();
    }
}
