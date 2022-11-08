package repository;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {

    boolean insertUser(User user) throws SQLException;

    User selectUser(int id);

    List<User> selectAllUsers();

    boolean deleteUser(int id) throws SQLException;

    boolean updateUser(User user) throws SQLException;

    List<User> selectByCountry(String countrySearch);

    List<User> sortByName();

    User getUserById(int id);

    void insertUserStore(User user) throws SQLException;

    void insertUpdateWithoutTransaction();

    void insertUpdateUseTransaction();

    // BÀI TẬP 1:
    List<User> listUserStore();

    void updateUserStore(User user);

    void deleteUserStore(int id);

    // BÀI TẬP 2:
    void addUserTransaction(User user, int[] permision);

}
