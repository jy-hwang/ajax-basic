package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDAO {

  private Connection conn;

  private PreparedStatement pstmt;

  private ResultSet rs;

  public UserDAO() {
    try {
      String dbUrl = System.getProperty("db.url");
      String dbUsername = System.getProperty("db.username");
      String dbPassword = System.getProperty("db.password");
      Class.forName("org.mariadb.jdbc.Driver");
      conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public ArrayList<User> search(String userName) {
    String sqlQuery =
        " SELECT user_name AS userName, user_age AS userAge, user_gender AS userGender, user_email AS userEmail FROM users WHERE user_name LIKE ?; ";
    ArrayList<User> userList = new ArrayList<User>();

    try {
      pstmt = conn.prepareStatement(sqlQuery);
      pstmt.setString(1, "%" + userName + "%");
      rs = pstmt.executeQuery();

      while (rs.next()) {
        User user = new User();
        user.setUserName(rs.getString(1));
        user.setUserAge(rs.getInt(2));
        user.setUserGender(rs.getString(3));
        user.setUserEmail(rs.getString(4));
        userList.add(user);
      }

    } catch (Exception e) {
      e.printStackTrace();
    }
    return userList;
  }

  public int register(User user) {
    String sqlQuery = " INSERT INTO users (user_name, user_age, user_gender, user_email) VALUES (?, ?, ?, ?); ";
    
    try {
      pstmt = conn.prepareStatement(sqlQuery);
      pstmt.setString(1,  user.getUserName());
      pstmt.setInt(2,  user.getUserAge());
      pstmt.setString(3,  user.getUserGender());
      pstmt.setString(4,  user.getUserEmail());
      return pstmt.executeUpdate();
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    return -1; // 데이터베이스 오류
  }
  
}
