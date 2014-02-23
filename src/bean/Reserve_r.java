package bean;
/**
 * 订单类
 * @author hp
 *
 */
public class Reserve_r {

	//预订单id
	private int rid;
	//预订用户的id
	private int uid;
	//预订用户的name
	private String uname;
	//预订的车辆名称 1 2 3..
	private String rcar;
	//预订的某天的某个时间点 8 10..自定
	private String rtime;
	//预订的日期 20130101
	private String rtime_day;
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getRcar() {
		return rcar;
	}
	public void setRcar(String rcar) {
		this.rcar = rcar;
	}
	public String getRtime() {
		return rtime;
	}
	public void setRtime(String rtime) {
		this.rtime = rtime;
	}
	public String getRtime_day() {
		return rtime_day;
	}
	public void setRtime_day(String rtime_day) {
		this.rtime_day = rtime_day;
	}
	
}
