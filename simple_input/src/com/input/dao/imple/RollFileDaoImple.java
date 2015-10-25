package com.input.dao.imple;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import com.input.dao.RollFileDao;
import com.input.pojo.RollFiles;

public class RollFileDaoImple implements RollFileDao {
	private SessionFactory sessionFactory;
	private HibernateTemplate hibernateTemplate;
	
	//获取HibernateTemplate持久层访问模块
	public HibernateTemplate getHibernateTemplate()
	{
		if(hibernateTemplate==null)
		{
			hibernateTemplate = new HibernateTemplate(sessionFactory);
		}
		return hibernateTemplate;
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	//增加 OK
	@Override
	public void save(RollFiles rollFile) {
		try {
			@SuppressWarnings("rawtypes")
			List list = getHibernateTemplate().find("from RollFiles");		
			RollFiles rf = (RollFiles) list.get(list.size()-1);
			rollFile.setId(rf.getId()+1);
			hibernateTemplate.save(rollFile);
		
		} catch (Exception e) {
			e.printStackTrace();	
		}
	}

	//查询
	@SuppressWarnings("unchecked")
	@Override
	public List<RollFiles> find(String queryStr) {
		List<RollFiles> list = null;
		try {
			getHibernateTemplate();
			list = hibernateTemplate.find(queryStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//更新
	@Override
	public void update(RollFiles rollFile) {
		getHibernateTemplate();
		hibernateTemplate.update(rollFile);
	}

	//删除
	@Override
	public void delete(String id) {
		getHibernateTemplate();
		String queryStr = "from RollFiles where id_rf='"+id+"'";
		RollFiles rollFile = this.find(queryStr).get(0);
		hibernateTemplate.delete(rollFile);
	}

}
