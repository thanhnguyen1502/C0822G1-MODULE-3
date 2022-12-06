package repository.impl;

import model.Contract;
import repository.IContractRepository;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
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
                String contractID = resultSet.getString("id");
                Date startDate = resultSet.getDate("start_date");
                Date endDate = resultSet.getDate("end_date");
                double deposit = resultSet.getDouble("deposit");
                int totalBill = resultSet.getInt("employee_id");

                contract = new Contract(contractID,startDate,endDate,deposit,totalBill);
                contractList.add(contract);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contractList;
    }
}
