package ayush;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

public class ToWhomAction {
	public List<ToWhom> list;

	public HttpSession session=ServletActionContext.getRequest().getSession();
	public String viewNotification(){
		if(session.getAttribute("userId") == null)
			return "nomessage";
		int id = (Integer)session.getAttribute("userId");
		list = UserDao.viewNotification(id);
		if(list.size() > 0)
			return "success";
		else
			return "nomessage";
	}
	
}
