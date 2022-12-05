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
    public boolean insertUser(User user) throws SQLException {
        return userRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userRepository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userRepository.updateUser(user);
    }

    @Override
    public List<User> selectByCountry(String countrySearch) {
        return userRepository.selectByCountry(countrySearch);
    }

    @Override
    public List<User> sortByName() {
        return userRepository.sortByName();
    }

    @Override
    public User getUserById(int id) {
        return userRepository.getUserById(id);
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        userRepository.insertUserStore(user);
    }

    @Override
    public void insertUpdateWithoutTransaction() {
        userRepository.insertUpdateWithoutTransaction();
    }

    @Override
    public void insertUpdateUseTransaction() {
        userRepository.insertUpdateUseTransaction();
    }

    @Override
    public List<User> listUserStore() {
        return userRepository.listUserStore();
    }

    @Override
    public void updateUserStore(User user) {
        userRepository.updateUserStore(user);
    }

    @Override
    public void deleteUserStore(int id) {
        userRepository.deleteUserStore(id);
    }

    @Override
    public void addUserTransaction(User user, int[] permision) {
        userRepository.addUserTransaction(user, permision);
    }
}
