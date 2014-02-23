package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Reserve_r;

import utils.DBUtil;

/**
 * 订座Dao
 * @author K
 *
 */
public class ReserveDao {

	private DBUtil dbutil;
	
	public ReserveDao(){
		dbutil=DBUtil.getInstance();
	}
	
	/**
	 * 增加预订
	 * @return
	 */
	public int addReserve(Reserve_r rr){
		Connection conn =null;
		PreparedStatement ps =null;
		//增加预订前确定此uid有无已预订
		String sql_query="select uid from reserve_r where uid =?";
		ResultSet rs=null;
		//增加预订
		String sql_add ="insert into reserve_r(uid,rcar) values(?,?)";
		int result_add=0;
		try {
			conn =dbutil.getConnection();
			ps=conn.prepareStatement(sql_query);
			ps.setInt(1, rr.getUid());
			rs = ps.executeQuery();
			if(!rs.next()){
				ps=conn.prepareStatement(sql_add);
				ps.setInt(1, rr.getUid());
				ps.setString(2, rr.getRcar());
				result_add = ps.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbutil.free(conn, ps, rs);
		}
		return result_add;
	}
	
	/**
	 * 通过car名字查询此car的reserve情况
	 * @param rcar
	 * @return
	 */
	public List<Reserve_r> queryReserve(String rcar){
		Connection conn =null;
		PreparedStatement ps =null;
		String sql_query_rcar="select rid,reserve_r.uid,rtime,rtime_day,uname from reserve_r,user_r where rcar =? and reserve_r.uid =user_r.uid";
		ResultSet rs =null;
		List<Reserve_r> lr =new ArrayList<Reserve_r>();
		try {
			conn= dbutil.getConnection();
			ps =conn.prepareStatement(sql_query_rcar);
			ps.setString(1, rcar);
			rs = ps.executeQuery();
			Reserve_r r =new Reserve_r();
			while(rs.next()){
				r.setRcar(rcar);
				r.setRid(rs.getInt("rid"));
				r.setRtime(rs.getString("rtime"));
				r.setRtime_day(rs.getString("rtime_day"));
				r.setUid(rs.getInt("uid"));
				r.setUname(rs.getString("uname"));
				lr.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbutil.free(conn, ps, rs);
		}
		return lr;
	}
	
	public int deleteReserve(int rid){
		Connection conn =null;
		PreparedStatement ps =null;
		String sql_delete ="delete from reserve_r where rid =?";
		int result_delete =0;
		try {
			conn =dbutil.getConnection();
			ps =conn.prepareStatement(sql_delete);
			ps.setInt(1, rid);
			result_delete = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbutil.free(conn, ps, null);
		}
		return result_delete;
	}
}
