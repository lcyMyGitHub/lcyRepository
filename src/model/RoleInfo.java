package model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
/**
 * 角色管理
 * @author john
 *
 */
@SuppressWarnings("serial")
public class RoleInfo extends Model<RoleInfo>{
	
	public static RoleInfo dao = new RoleInfo();
	
	/**
	 * 获取角色集合
	 * @return
	 */
	public List<RoleInfo> getRoleInfoList() throws Exception
	{
		return RoleInfo.dao.find("select * from sf_role ");
	}
	
	/**
	 * 添加角色
	 * @param role_name
	 * @param role_remarks
	 * @param role_str
	 * @param role_ids
	 * @return
	 */
	public boolean saveRoleInfo(String role_name,String role_remarks,String role_str,String role_ids)
	{
		return RoleInfo.dao.set("role_name", role_name)
				.set("role_remarks", role_remarks)
				.set("role_str", role_str)
				.set("role_ids", role_ids)
				.remove("role_id").save();
	}
	/**
	 * 编辑角色信息
	 * @param role_id
	 * @param role_name
	 * @param role_remarks
	 * @param role_str
	 * @param role_ids
	 * @return
	 */
	public boolean editRoleInfo(long role_id,String role_name,String role_remarks,String role_str,String role_ids)
	{
		return RoleInfo.dao.findById(role_id)
				.set("role_name", role_name)
				.set("role_remarks", role_remarks)
				.set("role_str", role_str)
				.set("role_ids", role_ids)
				.update();
	}
	

}
