package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import bean.User_r;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

import dao.UserDao;

public class UserAction implements Action ,ModelDriven<User_r>{

	private User_r user_r =new User_r();
	private UserDao ud = new UserDao();
	
	public String execute() throws Exception {
		return null;
	}

	public String LoginUser(){
		HttpServletRequest request =ServletActionContext.getRequest();
		HttpSession  ss= request.getSession();
		//登陆成功时uid不为空
		ss.setAttribute("user_r", ud.Login(user_r));
		return SUCCESS;
	}
	
	public String SignInUser(){
		HttpServletRequest request =ServletActionContext.getRequest();
		HttpSession  ss= request.getSession();
		//登陆成功时uid不为空
		ss.setAttribute("user_r", ud.SignIn(user_r));
		return SUCCESS;
	}
	
	public String ExitUser(){
		HttpServletRequest request =ServletActionContext.getRequest();
		HttpSession  ss= request.getSession();
		ss.setAttribute("user_r",null);
		return "queryReserve";
	}
	
	
	public User_r getModel() {
		return user_r;
	}

	public User_r getUser_r() {
		return user_r;
	}
	

}
