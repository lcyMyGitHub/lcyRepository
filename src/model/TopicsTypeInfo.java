package model;

import java.util.List;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
/**
 * 课题分类
 * @author john
 *
 */
@SuppressWarnings("serial")
public class TopicsTypeInfo extends Model<TopicsTypeInfo>{
	public static TopicsTypeInfo dao = new TopicsTypeInfo();
	
	/**
	 * 获取课题分类集合
	 * @return
	 */
	public List<TopicsTypeInfo> getTopicsTypeInfoList()
	{
		
		return TopicsTypeInfo.dao.find("select * from sf_topics_type");
	}
	
	/**
	 * 保存课题分类
	 * @param type_name
	 * @param type_icon
	 * @param type_pid
	 * @return
	 */
	public boolean saveTopicsTypeInfo(String type_name,String type_icon,long type_pid)
	{
		return TopicsTypeInfo.dao.set("type_name", type_name).set("type_icon", type_icon).set("type_pid", type_pid).remove("type_id").save();
	}
	/**
	 * 修改课题分类
	 * @param type_name
	 * @param type_icon
	 * @param type_pid
	 * @return
	 */
	public boolean updateTopicsTypeInfo(long type_id,String type_name,String type_icon,long type_pid)
	{
		return TopicsTypeInfo.dao.findById(type_id).set("type_name", type_name).set("type_icon", type_icon).set("type_pid", type_pid).update();
	}
	
	/**
	 * 根据父节点 删除子节点
	 * @param type_id
	 * @return
	 */
	public int deleteTopicsTypeInfo(long type_id)
	{
		return Db.update("delete from sf_topics_type where type_pid="+type_id);
	}
	
	
}
