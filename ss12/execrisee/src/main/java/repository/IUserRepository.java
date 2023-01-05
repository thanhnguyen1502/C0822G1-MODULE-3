package repository;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    List<User> selectAllUsers();
    boolean insertUser(User user);
    User selectUser(int id);
    boolean deleteUser(int id) throws SQLException;
    boolean updateUser(User user) throws SQLException;
    List<User> searchByCountry(String countrySearch);
    List<User> sortByName();
}
