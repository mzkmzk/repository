package action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import bean.Reserve_r;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

import dao.ReserveDao;

public class ReserveAction implements Action,ModelDriven<Reserve_r>{

	private Reserve_r reserve_r =new Reserve_r();
	private ReserveDao rd =new ReserveDao();
	private int msg =0;
	public String addReserve(){
		HttpServletRequest request =ServletActionContext.getRequest();
		reserve_r.setRcar(request.getParameter("rcar"));
		reserve_r.setUid(Integer.parseInt(request.getParameter("uid")));
		System.out.println("uid : "+reserve_r.getUid()+"rcar is "+reserve_r.getRcar());
		msg = rd.addReserve(reserve_r);
		return SUCCESS;
	}
	
	public String queryReserve(){
		HttpServletRequest request =ServletActionContext.getRequest();
		request.setAttribute("oneCar",rd.queryReserve("1"));
		request.setAttribute("twoCar",rd.queryReserve("2"));
		request.setAttribute("threeCar",rd.queryReserve("3"));
		request.setAttribute("fourCar",rd.queryReserve("4"));
		request.setAttribute("fiveCar",rd.queryReserve("5"));
		return "index.jsp";
	}
	
	public String deleteReserve(){
		HttpServletRequest request =ServletActionContext.getRequest();
		System.out.println(Integer.parseInt(request.getParameter("rid")));
		rd.deleteReserve(Integer.parseInt(request.getParameter("rid")));
		return "queryReserve";
	}
	
	
	public String execute() throws Exception {
		return null;
	}

	public Reserve_r getModel() {
		return reserve_r;
	}

	public int getMsg() {
		return msg;
	}


}
