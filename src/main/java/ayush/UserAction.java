package ayush;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

public class UserAction {
	private User user;
	public List<User> list1;
	public HttpSession session=ServletActionContext.getRequest().getSession();
	
	


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public String validate(){
		if(user == null){
			return "error";
		}
		List<User> list = UserDao.validate(user);
		//System.out.println("hello"+list.get(0).getPosition());
		
		if(list.size() > 0){
			if(list.get(0).getStatus().equals("inactive"))
				return "contact";
			user.setPosition(list.get(0).getPosition());
			session.setAttribute("login","true" );
			session.setAttribute("userId",list.get(0).getUserId() );
			session.setAttribute("userName",list.get(0).getUserName() );
			session.setAttribute("position",list.get(0).getPosition() );
//			if(list.get(0).getPosition().equals("management"))
//				return "success1";
//			else if(list.get(0).getPosition().equals("manager"))
//				return "success2";
//			else if(list.get(0).getPosition().equals("employee"))
//				return "success3";
//			else
//				return "error";
			return "success";
		}	
		else
			return "error";
	}
	public String view(){
		list1 = UserDao.fetch((Integer)session.getAttribute("userId"));
		if(list1.size() > 0)
			return "success";
		else
			return "error";
	}
	public String change(){
		UserDao.change(user.getUserId(),user.getStatus());
		return "success";
	}
	public String create(){
		user.setRegistrationDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		if(UserDao.create(user))
			return "success";
		else
			return "error";
	}
	public String listManager(){
		list1 = UserDao.listManager();
		return "success";
	}
	
	public String logout(){
		if(session != null){
			session = ServletActionContext.getRequest().getSession(false);
			session.removeAttribute("login");
			session.removeAttribute("userId");
			session.removeAttribute("userName");
			session.removeAttribute("position");
		}
		return "success";
	}
	

}
