package dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.User_r;
import utils.DBUtil;

public class UserDao {

	private DBUtil dbutil;
	
	public UserDao(){
		dbutil=DBUtil.getInstance();
	}
	
	//用户注册
	public User_r SignIn(User_r u){
		Connection conn =null;
		PreparedStatement ps =null;
		String sql_SignIn= " insert into user_r(uname,upasswd) values(?,?)";
		ResultSet rs=null;
		Serializable ret = null;
		try {
			conn =dbutil.getConnection();
			ps = conn.prepareStatement(sql_SignIn);
			System.out.println(u.getUname()+"注册"+u.getUpasswd());
			ps.setString(1, u.getUname());
			ps.setString(2, u.getUpasswd());
			ps.executeUpdate();
			//获取uid
			rs =ps.getGeneratedKeys();
			if(rs.next()){
				ret = (Serializable) rs.getObject(1); 
				u.setUid(Integer.parseInt(ret.toString()));
			}
				 
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbutil.free(conn, ps, rs);
		}
		return u;
	}
	
	//用户登陆
	public User_r Login(User_r u){
		Connection conn =null;
		PreparedStatement ps =null;
		ResultSet rs =null;
		String sql_Login ="select uid from User_r where uname =? and upasswd=?";
		try {
			conn =dbutil.getConnection();
		    ps =conn.prepareStatement(sql_Login);
		    ps.setString(1, u.getUname());
		    ps.setString(2, u.getUpasswd());
		    System.out.println(u.getUname()+"登陆"+u.getUpasswd());
		    rs = ps.executeQuery();
		    if(rs.next()){
		    	u.setUid(rs.getInt("uid"));
		    }
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbutil.free(conn, ps, rs);
		}
		return u;
		
	}
	
}
