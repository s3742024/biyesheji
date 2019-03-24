package service;

import java.util.ArrayList;

import bean.HouseBase;
import bean.RealInfo;
import bean.SellAudit;
import bean.SellInfo;
import bean.User;
import dao.ManagerDao;
import dao.TransactionDao;
import dao.UserDao;

public class RootService {
	public ArrayList<User> QueryAllUser(){
		ArrayList<User> Users=UserDao.QueryAllUser();
		if(Users!=null) {
			return Users;
		}else {
			return null;
		}
	}
	/**
	 * 
	 * @description 修改用户个人信息 可改的为用户权限和管理员备注
	 * @param 用户的bean
	 * @return true=成功 false=失败
	 */
	public boolean UpdateUserInfo(User user) {
		if(UserDao.UpdateUserInfo(user)){
			return true;
		}else {
			return false;
		}
	}
	/**
	 * 
	 * @description 查询所有个人资料 
	 * @return realInfo的bean类的数组 没有查询到和出现异常为null
	 */
	public ArrayList<RealInfo> queryPersonalData(){
		ArrayList<RealInfo> realInfo=UserDao.queryPersonalData();
		if(realInfo!=null) {
			return realInfo;
		}else {
			return null;
		}
	}
	/**
	 * 
	 * @description 获取所有房屋基本信息
	 * @return sellInfo houseBase的bean的数组，null没有查询到和出现异常
	 */
	public ArrayList<HouseBase> QueryAllHouseBase(){
		ArrayList<HouseBase> houseBases=TransactionDao.QueryAllHouseBase();
		if(houseBases!=null) {
			return houseBases;
		}else {
			return null;
		}
	}
	/**
	 * 
	 * @description 获取所有待审核信息
	 * @return sellInfo的bean的数组，null没有查询到和出现异常
	 */
	public ArrayList<SellInfo> QueryAllToBeAudited(){
		ArrayList<SellInfo> sellInfos=TransactionDao.QueryAllToBeAudited();
		if(sellInfos!=null) {
			return sellInfos;
		}else {
			return null;
		}
	}
	/**
	 * 
	 * @description 插入审核信息
	 * @param sellAudit的bean类
	 * @return true=成功 false=失败
	 */
	public boolean updateSellAudit(SellAudit sellAudit) {
		if(ManagerDao.updateSellAudit(sellAudit)){
			return true;
		}else {
			return false;
		}
	}
	/**
	 * 
	 * @description 根据用户昵称获取所有审核信息
	 * @param userid 用户的id
	 * @return SellAudit的bean的数组，每个里面有sellInfo的子类,null没有查询到和出现异常
	 */
	public ArrayList<SellAudit> queryAuditedByNickname(String nickname){
		String userid = UserDao.QueryUserBydNickName(nickname);
		ArrayList<SellAudit> sellAudits=ManagerDao.QueryAuditedById(userid);
		if(sellAudits!=null) {
			return sellAudits;
		}else {
			return null;
		}
	}
}
