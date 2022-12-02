package service.impl;

import model.User;
import reposiitory.IUserRepository;
import reposiitory.impl.UserRepository;
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
}
