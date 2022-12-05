package repository.impl;

import model.User;
import repository.BaseRepository;
import repository.IUserRepository;

import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private final String SELECT_ALL = "select * from user_manager.user";
    private final String INSERT_INTO = "insert into user_manager.`user` (`name`, email, country) value (?,?,?);";
    private final String DELETE_USERS_SQL = "delete from user_manager.user where id = ?;";
    private final String SELECT_USER_BY_ID = "select id,name,email,country from user_manager.user where id =?";
    private final String UPDATE_USERS_SQL = "update user_manager.user set name = ?,email= ?, country =? where id = ?;";
    private final String SELECT_USER_BY_COUNTRY = "select id,name,email,country from user_manager.user where country like ?;";
    private final String SORT_BY_NAME = "select * from `user` order by `name`;";
    private final String SQL_INSERT = "INSERT INTO EMPLOYEE (NAME, SALARY, CREATED_DATE) VALUES (?,?,?)";
    private final String SQL_UPDATE = "UPDATE EMPLOYEE SET SALARY=? WHERE NAME=?";

    private final String SQL_TABLE_CREATE = "CREATE TABLE EMPLOYEE"
            + "("
            + " ID serial,"
            + " NAME varchar(100) NOT NULL,"
            + " SALARY numeric(15, 2) NOT NULL,"
            + " CREATED_DATE timestamp,"
            + " PRIMARY KEY (ID)"
            + ")";

    private final String SQL_TABLE_DROP = "DROP TABLE IF EXISTS EMPLOYEE";

    // BÀI TẬP:
    private final String LIST_USER_STORE = "CALL list_user();";
    private final String UPDATE_USER_STORE = "CALL update_user(?,?,?,?);";
    private final String DELETE_USER_STORE = "CALL delete_user(?);";

    @Override
    public boolean insertUser(User user) {
        Connection connection = BaseRepository.getConnecDB();
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            int check = preparedStatement.executeUpdate();
            return (check == 1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        Connection connection = BaseRepository.getConnecDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> userList = new ArrayList<>();
        Connection connection = BaseRepository.getConnecDB(); // Tạo connection
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id, name, email, country);
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        Connection connection = BaseRepository.getConnecDB();
        PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);
        statement.setInt(1, id);
        rowDeleted = statement.executeUpdate() > 0;
        return rowDeleted;
    }


    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdate;
        Connection connection = BaseRepository.getConnecDB();
        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL);
        preparedStatement.setString(1, user.getName());
        preparedStatement.setString(2, user.getEmail());
        preparedStatement.setString(3, user.getCountry());
        preparedStatement.setInt(4, user.getId());

        rowUpdate = preparedStatement.executeUpdate() > 0;

        return rowUpdate;

    }

    @Override
    public List<User> selectByCountry(String countrySearch) {
        List<User> userList = new ArrayList<>();
        Connection connection = BaseRepository.getConnecDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_COUNTRY);
            preparedStatement.setString(1, "%" + countrySearch + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id, name, email, country);
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public List<User> sortByName() {
        List<User> userList = new ArrayList<>();
        Connection connection = BaseRepository.getConnecDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SORT_BY_NAME);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id, name, email, country);
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public User getUserById(int id) {
        User user = null;
        String query = "CALL get_user_by_id(?)";

        Connection connection = BaseRepository.getConnecDB();

        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setInt(1, id);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        String query = "CALL insert_user(?,?,?)";

        Connection connection = BaseRepository.getConnecDB();
        CallableStatement callableStatement = connection.prepareCall(query);
        callableStatement.setString(1, user.getName());
        callableStatement.setString(2, user.getEmail());
        callableStatement.setString(3, user.getCountry());
        callableStatement.executeUpdate();
    }

    @Override
    public void insertUpdateWithoutTransaction() {
        try (Connection conn = BaseRepository.getConnecDB();

             Statement statement = conn.createStatement();

             PreparedStatement psInsert = conn.prepareStatement(SQL_INSERT);

             PreparedStatement psUpdate = conn.prepareStatement(SQL_UPDATE)) {



            statement.execute(SQL_TABLE_DROP);

            statement.execute(SQL_TABLE_CREATE);



            // Run list of insert commands

            psInsert.setString(1, "Quynh");

            psInsert.setBigDecimal(2, new BigDecimal(10));

            psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));

            psInsert.execute();



            psInsert.setString(1, "Ngan");

            psInsert.setBigDecimal(2, new BigDecimal(20));

            psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));

            psInsert.execute();



            // Run list of update commands



            // below line caused error, test transaction

            // org.postgresql.util.PSQLException: No value specified for parameter 1.

            psUpdate.setBigDecimal(2, new BigDecimal(999.99));



            //psUpdate.setBigDecimal(1, new BigDecimal(999.99));

            psUpdate.setString(2, "Quynh");

            psUpdate.execute();



        } catch (Exception e) {

            e.printStackTrace();

        }
    }

    @Override
    public void insertUpdateUseTransaction() {
        try (Connection conn = BaseRepository.getConnecDB();

             Statement statement = conn.createStatement();

             PreparedStatement psInsert = conn.prepareStatement(SQL_INSERT);

             PreparedStatement psUpdate = conn.prepareStatement(SQL_UPDATE)) {

            statement.execute(SQL_TABLE_DROP);

            statement.execute(SQL_TABLE_CREATE);

            // start transaction block

            conn.setAutoCommit(false); // default true

            // Run list of insert commands

            psInsert.setString(1, "Quynh");

            psInsert.setBigDecimal(2, new BigDecimal(10));

            psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));

            psInsert.execute();



            psInsert.setString(1, "Ngan");

            psInsert.setBigDecimal(2, new BigDecimal(20));

            psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));

            psInsert.execute();


            //Chạy danh sách các lệnh cập nhật

            // dòng dưới đây gây ra lỗi, giao dịch thử nghiệm

            // org.postgresql.util.PSQLException: No value specified for parameter 1.

            psUpdate.setBigDecimal(1, new BigDecimal(999.99));



            //psUpdate.setBigDecimal(1, new BigDecimal(999.99));

            psUpdate.setString(2, "Quynh");

            psUpdate.execute();


            //kết thúc khối giao dịch, cam kết thay đổi

            conn.commit();


            // thực hành tốt để đặt nó trở lại mặc định true

            conn.setAutoCommit(true);



        } catch (Exception e) {

            System.out.println(e.getMessage());

            e.printStackTrace();

        }
    }

    // BÀI TẬP 1:
    @Override
    public List<User> listUserStore() {
        List<User> userList = new ArrayList<>();

        Connection connection = BaseRepository.getConnecDB();

        try {
            CallableStatement callableStatement = connection.prepareCall(LIST_USER_STORE);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id,name, email, country);
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public void updateUserStore(User user) {
        Connection connection = BaseRepository.getConnecDB();

        try {
            CallableStatement callableStatement = connection.prepareCall(UPDATE_USER_STORE);
            callableStatement.setInt(1,user.getId());
            callableStatement.setString(2,user.getName());
            callableStatement.setString(3,user.getEmail());
            callableStatement.setString(4,user.getCountry());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteUserStore(int id) {
        Connection connection = BaseRepository.getConnecDB();

        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_USER_STORE);
            callableStatement.setInt(1,id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // BÀI TẬP 2:
    @Override
    public void addUserTransaction(User user, int[] permision) {
        Connection conn = null;

        //để chèn một người dùng mới

        PreparedStatement pstmt = null;

        //để gán hoán vị cho người dùng

        PreparedStatement pstmtAssignment = null;

        // để lấy id người dùng

        ResultSet rs = null;

        try {

            conn = BaseRepository.getConnecDB();

            //
            //đặt cam kết tự động thành false

            conn.setAutoCommit(false);

            //

            //
            //Chèn người dùng

            //

            pstmt = conn.prepareStatement(INSERT_INTO, Statement.RETURN_GENERATED_KEYS);

            pstmt.setString(1, user.getName());

            pstmt.setString(2, user.getEmail());

            pstmt.setString(2, user.getCountry()); // NHẬP SAI VỊ TRÍ PRAM ĐỂ KO THỂ INSERT ĐƯỢC

            int rowAffected = pstmt.executeUpdate();

            // get user id

            rs = pstmt.getGeneratedKeys();

            int userId = 0;

            if (rs.next())

                userId = rs.getInt(1);

            //

            // trong trường hợp thao tác chèn thành công, hãy chỉ định hoán vị cho người dùng

            //

            if (rowAffected == 1) {

                //
                //gán hoán vị cho người dùng

                String sqlPivot = "INSERT INTO user_permision(user_id,permision_id) "

                        + "VALUES(?,?)";

                pstmtAssignment = conn.prepareStatement(sqlPivot);

                for (int permisionId : permision) {

                    pstmtAssignment.setInt(1, userId);

                    pstmtAssignment.setInt(2, permisionId);

                    pstmtAssignment.executeUpdate();

                }

                conn.commit();

            } else {

                conn.rollback();

            }

        } catch (SQLException ex) {

            // quay trở lại giao dịch

            try {

                if (conn != null)

                    conn.rollback();

            } catch (SQLException e) {

                System.out.println(e.getMessage());

            }

            System.out.println(ex.getMessage());

        } finally {

            try {

                if (rs != null) rs.close();

                if (pstmt != null) pstmt.close();

                if (pstmtAssignment != null) pstmtAssignment.close();

                if (conn != null) conn.close();

            } catch (SQLException e) {

                System.out.println(e.getMessage());

            }

        }
    }
}
