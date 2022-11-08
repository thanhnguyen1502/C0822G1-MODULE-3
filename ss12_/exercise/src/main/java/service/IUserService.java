package service;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    List<User> findAll();

    void addNewUser(User user);

    void editUser(User user);

    void deleteUser(int id) throws SQLException;

    List<User> findByCountry(String country);

    List<User> sortByName();

    User findById(int id) throws SQLException;
}
