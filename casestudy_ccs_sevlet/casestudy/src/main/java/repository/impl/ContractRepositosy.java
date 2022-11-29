package repository.impl;

import model.Contract;
import repository.IContractRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContractRepositosy implements IContractRepository {
    private final String SELECT_ALL = "select * from furama_management.contract;";
    @Override
    public List<Contract> selectAllContract() {
        List<Contract> contractList = new ArrayList<>();
        Contract contract = null;

        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
//                String contractID, LocalDate startDate, java.time.LocalDate endDate, double deposit, int totalBill
                String contractID = resultSet.getString("");
                Date startDate = resultSet.getDate("");
                String endDate = resultSet.getString("");
                double deposit = resultSet.getDouble("");
                int totalBill = resultSet.getInt("");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
