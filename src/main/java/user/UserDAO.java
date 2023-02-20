package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost/moordo91";
			String dbID ="moordo91";
			String dbPassword = "CwC7iMsj@Gswtuv";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getUserID(String userEmail) {
		String SQL = "SELECT userID FROM user WHERE userEmail = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String userID = rs.getString("userID");
				return userID;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int login(String userEmail, String userPassword) {
		String SQL = "SELECT userPassword FROM user WHERE userEmail = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				}
				return 0; // 비밀번호 틀림
			}
			return -1; // 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO user VALUES (?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserEmail());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserID());
			pstmt.setString(4, user.getUserName());
			pstmt.setString(5, user.getUserPhone());
			pstmt.setString(6, String.valueOf(user.getUserGender()));
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
