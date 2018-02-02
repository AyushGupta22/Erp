package ayush;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;


public class UserDao {

	static SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
	public static List<User> validate(User user) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(User.class);
		Criterion userName = Restrictions.eq("userName", user.getUserName());
		Criterion password = Restrictions.eq("password", user.getPassword());
		LogicalExpression andExp = Restrictions.and(userName, password);
		cr.add(andExp);
		/*String hql = "from User u where u.userName = :username and u.password = :password";
		String hql = "from User u where u.userName = '"+user.getUserName()+"' and u.password = '"+user.getPassword()+"'";
		Query query = session.createQuery(hql);
		System.out.println("Hello"+user.getUserName());
		System.out.println("Hello"+user.getPassword());
		query.setParameter("username",user.getUserName());
		query.setParameter("password", user.getPassword());
		List<User> list = query.list();*/
		List<User> list = cr.list();
		System.out.println("Size "+list.size());
		session.close();
		return list;
	}
	public static List<User> fetch(int id) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(User.class);
		Criterion managerId = Restrictions.eq("managerId", id);
		System.out.println("ID = "+id);
		if(id == 1)
			managerId = Restrictions.ne("managerId", 0);
		cr.add(managerId);
		cr.addOrder(Order.asc("position"));//manager is coming first in employee as it is of type enum.
		cr.addOrder(Order.asc("userName"));
		List<User> list=cr.list();
		System.out.println("Size is "+list.size());
		session.close();
		return list;
	}
	public static void change(int userId,String status) {
		// TODO Auto-generated method stub
		if(status.equals("active"))
			status = "inactive";
		else
			status = "active";
		int res = 0;
		System.out.println(userId);
		System.out.println(status);
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		//session1.flush();
		try{
		Query qry = session.createQuery("update User u set u.status= :status where u.userId= :userId");
		qry.setParameter("status",status);
		qry.setParameter("userId", userId);
		res = qry.executeUpdate();
		transaction.commit();
		}catch(Exception e){
			System.out.println(e.getMessage());
			transaction.rollback();
		}
		session.close();
		
		System.out.println(res);
		
	}
	public static boolean create(User u) {
		// TODO Auto-generated method stub
		Session session = null;
		session = factory.openSession();
		session.beginTransaction();
		try {
			session.save(u);
			session.getTransaction().commit();
			session.close();
			return true;
		} catch (Exception e) {
			session.getTransaction().rollback();
			session.close();
			return false;
		}
		
	}
	/*public static int notificationMessage(Message m){
		Session session = factory.openSession();
		session.beginTransaction();
		try {
			int mid = (Integer)session.save(m);
			System.out.println(mid);
			session.getTransaction().commit();
			session.close();
			return mid;
		} catch (Exception e) {
			session.getTransaction().rollback();
			session.close();
			return 0;
		}
	}*/
	public static boolean insertMessage(String name,Message mid) {
		// TODO Auto-generated method stub
		String a[]=name.split(",");
		ToWhom tw = new ToWhom();
		for(int i = 0;i < a.length;i++){
			tw.setReceiverid(Integer.parseInt(a[i]));
			tw.setMid(mid);
			Session session = factory.openSession();
			session.beginTransaction();
			try {
				session.save(tw);
				session.getTransaction().commit();
				session.close();
			} catch (Exception e) {
				session.getTransaction().rollback();
				session.close();
				return false;
			}
			
		}
		return true;
	}
	public static List<ToWhom> viewNotification(int id) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(ToWhom.class);
		Criterion receiverId = Restrictions.eq("receiverid", id);
		System.out.println("ID = "+id);
		cr.add(receiverId);
		List<ToWhom> list=cr.list();
		System.out.println("Size is "+list.size());
		for(int i = 0;i<list.size();i++)
			System.out.println("Message is "+list.get(i).getMid().getMessage());
		session.close();
		return list;
		
	}
	public static List<User> listManager() {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(User.class);
		Criterion position = Restrictions.ne("position", "employee");
		cr.add(position);
		List<User> list = cr.list();
		session.close();
		return list;
	}

}
