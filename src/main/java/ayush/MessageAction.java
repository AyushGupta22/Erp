package ayush;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MessageAction {
	private Message m;
	private MessageBean mbean;
	public MessageBean getMbean() {
		return mbean;
	}

	public void setMbean(MessageBean mbean) {
		this.mbean = mbean;
	}



	private int senderid;
	private String subject,message,name;

	public int getSenderid() {
		return senderid;
	}

	public void setSenderid(int senderid) {
		this.senderid = senderid;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Message getM() {
		return m;
	}

	public void setM(Message m) {
		this.m = m;
	}

	
	
	public String notificationMessage(){
		
		System.out.println(message);
		setM(new Message());
		m.setMessage(mbean.getMessage());
		m.setSenderid(mbean.getSenderid());
		m.setSubject(mbean.getSubject());
		m.setMsgtime(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		//int mid=UserDao.notificationMessage(m);
		//if(mid == 0)
		//	return "error";
		//System.out.println(name.split(",")[0]);
		//else{
		if(UserDao.insertMessage(mbean.getName(),m))
			return "success";
		else
			return "error";
		//}
	}
}
