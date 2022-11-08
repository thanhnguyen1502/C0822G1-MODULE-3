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
        return this.userRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return this.userRepository.selectUser(id);
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
        return this.userRepository.updateUser(user);
    }

    @Override
    public List<User> selectByCountry(String country) {
        return this.userRepository.selectByCountry(country);
    }

    @Override
    public List<User> sortByName() {
        return this.userRepository.sortByName();
    }

    @Override
    public User getUserById(int id) {
        return this.userRepository.getUserById(id);
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        this.userRepository.insertUserStore(user);
    }

    @Override
    public void insertUpdateWithoutTransaction() {
        this.userRepository.insertUpdateWithoutTransaction();
    }

    @Override
    public void insertUpdateUseTransaction() {
        this.userRepository.insertUpdateUseTransaction();
    }

    // BÀI TẬP 1:
    @Override
    public List<User> listUserStore() {
        return this.userRepository.listUserStore();
    }

    @Override
    public void updateUserStore(User user) {
        this.userRepository.updateUserStore(user);
    }

    @Override
    public void deleteUserStore(int id) {
        this.userRepository.deleteUserStore(id);
    }

    // BÀI TẬP 2:
    @Override
    public void addUserTransaction(User user, int[] permision) {
        this.userRepository.addUserTransaction(user,permision);
    }
}
