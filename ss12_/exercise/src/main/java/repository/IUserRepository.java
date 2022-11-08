package repository;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {

    List<User> findAll();

    boolean addNewUser(User user) throws SQLException;

    void editUser(User user);

    boolean deleteUser(int id) throws SQLException;

    List<User> findByCountry(String country);

    List<User> sortByName();

    User findById(int id) throws SQLException;
}
