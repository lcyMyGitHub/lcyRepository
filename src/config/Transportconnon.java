package config;



import controller.admin.*;
import controller.user.*;
import model.*;
import util.ImageController;
import util.SMSAuthenticationCodeController;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.ViewType;


public class Transportconnon extends JFinalConfig {


	@Override
	public void configConstant(Constants me) {
		PropKit.use("a_little_config.txt");
		me.setDevMode(PropKit.getBoolean("devMode", false));
		me.setViewType(ViewType.JSP);
		me.setError404View("404.html");
		me.setError500View("500.html");
	}

	@Override
	public void configRoute(Routes me) {
		//目录  ：    首页>系统管理>系统设置
		me.add("/systembase", SystemBaseController.class);//系统设置（基本设置）
		me.add("/admin", AdminController.class);//管理员管理
		me.add("/res", ResourceController.class);//栏目管理
		me.add("/role", RoleController.class);//角色管理
		me.add("/log",AdminLogController.class);//系统日志----lxm
		me.add("/opinion", OpinionController.class);//意见反馈
		me.add("/lunbotu", LunbotuController.class);//轮播图管理
		me.add("/news", NewsController.class);//资讯管理


		me.add("/topics", TopicController.class);//课题
		me.add("/tt", TopicsTypeController.class);//课题分类
		me.add("/upd", ImageController.class);//图片上传
		me.add("/select", SelectController.class);//后台查看课题





		/*前台*/
		me.add("/personal", PersonalController.class);//我的
		me.add("/userOpinion", OpinionUserController.class);//意见反馈



		me.add("/", IndexController.class);//初始化
		me.add("/userTopics", TopicsUserController.class);//课题信息初始化




		/**
		 * 创建人: zal
		 */
		me.add("/SMSAuthenticationCode", SMSAuthenticationCodeController.class);
		me.add("/userInfo", UserController.class);
		me.add("/addressInfo", AddressController.class);
	}

	@Override
	public void configPlugin(Plugins me) {
		// TODO Auto-generated method stub
		C3p0Plugin c3p0Plugin = new C3p0Plugin(PropKit.get("url"), PropKit.get("username"), PropKit.get("password").trim());
		me.add(c3p0Plugin);
		//配置缓存插件
		me.add(new EhCachePlugin());
		ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		me.add(arp);

		arp.addMapping("sf_config", "config_id", SystemBaseInfo.class);//系统设置
		arp.addMapping("sf_admin","admin_id", AdminInfo.class);//管理员表
		arp.addMapping("sf_admin_log","log_id", AdminLogInfo.class);//管理员操作记录表
		arp.addMapping("sf_role","role_id", RoleInfo.class);//角色表
		arp.addMapping("sf_resource_role","role_id,resource_id", ResourceRoleInfo.class);//角色权限表
		arp.addMapping("sf_resource","resource_id", ResourceInfo.class);//栏目表
		arp.addMapping("sf_opinion", "opinion_id", OpinionInfo.class);//反馈意见表
		arp.addMapping("sf_news", "news_id", NewsInfo.class);//资讯表


		arp.addMapping("sf_topic", "topic_id", TopicInfo.class);//课题
		arp.addMapping("sf_topics_type","type_id", TopicsTypeInfo.class);//课题分类
		arp.addMapping("sf_topic_img","img_id", TopicsImg.class);//课题图片
		arp.addMapping("sf_topic_user", "topic_user_id", SelectInfo.class);//选题



		/**
		 * 创建人: zal
		 */
		arp.addMapping("sf_user", "user_id", UserInfo.class); // 用户信息表
		arp.addMapping("sf_address", "address_id", AddressInfo.class); // 收货人信息表
	}

	@Override
	public void configInterceptor(Interceptors me) {

		/* me.add(new AdminLoginInterceptor());*/
	}

	@Override
	public void configHandler(Handlers me) {
		// TODO Auto-generated method stub

	}

}
