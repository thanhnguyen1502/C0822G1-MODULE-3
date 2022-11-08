package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();


    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public void addNewUser(User user) {
        try {
            userRepository.addNewUser(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void editUser(User user) {
        userRepository.editUser(user);
    }

    @Override
    public void deleteUser(int id) throws SQLException {
        userRepository.deleteUser(id);
    }

    @Override
    public List<User> findByCountry(String country) {
        return userRepository.findByCountry(country);
    }

    @Override
    public List<User> sortByName() {
        return userRepository.sortByName();
    }


    @Override
    public User findById(int id) throws SQLException {
        return userRepository.findById(id);
    }
}
